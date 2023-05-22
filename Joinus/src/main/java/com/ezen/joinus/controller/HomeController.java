package com.ezen.joinus.controller;


import com.ezen.joinus.dto.AttachFileDTO;
import com.ezen.joinus.service.*;
import com.ezen.joinus.vo.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.*;

@Controller
public class HomeController {

    @Setter(onMethod_=@Autowired)
    private ProductService productService;
    @Setter(onMethod_=@Autowired)
    private FileService fileService;
    @Setter(onMethod_=@Autowired)
    private CustomerService customerService;
    @Setter(onMethod_=@Autowired)
    private WishlistService wishlistService;
    @Setter(onMethod_=@Autowired)
    private CartService cartService;

    //페이징 처리
    @GetMapping("/product_board")

    public String boardList(PagingVO vo,Model model,HttpSession session
            , @RequestParam(value="nowPage", required=false)String nowPage
            , @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
        System.out.println(vo);
        CustomerUserVO customerloginUser = (CustomerUserVO) session.getAttribute("customerUserVO");

        int total = productService.countBoard();
        if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "5";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "5";
        }
        vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
        model.addAttribute("paging", vo);
        List<ProductVO> productList = productService.selectBoard(vo);

        List<AttachFileDTO> thumbnailList = new ArrayList<>();

        for(ProductVO product : productList){
            thumbnailList.add(fileService.selectMainThumbnail(product.getPno()));
            System.out.println(fileService.selectMainThumbnail(product.getPno()));
        }

        System.out.println(">> " + thumbnailList);

        model.addAttribute("productList", productList);
        model.addAttribute("thumbnailList", thumbnailList);
        model.addAttribute("customerloginUser",customerloginUser);

        return "main/about";
    }
    // 게시물 이동

    @RequestMapping(value = "/board/read", method = RequestMethod.GET)
    public String read(@ModelAttribute("ProductVO") ProductVO productVO, Model model, @RequestParam("pno") int pno, HttpSession session){
        // 상품 정보 가져오기(썸네일, 상세정보 포함)
        productVO = productService.getProductContents(pno);
        productVO.setThumbnailList(fileService.selectThumbnailList(productVO.getPno()));
        productVO.setDetail(fileService.selectDetail(productVO.getPno()));
        System.out.println(productVO);
        model.addAttribute("productVO", productVO);

        // 사용자 정보 가져오기
        String u_id = (String) session.getAttribute("id");
        System.out.println("로그인 된 사용자 아이디 불러오나?:"+u_id);
        CustomerUserVO customerUserVO = customerService.getCustomerById(u_id);
        System.out.println(customerUserVO);
        model.addAttribute("customerUserVO", customerUserVO);

        try{
            WishlistVO wishlist = wishlistService.getWishlistByPnoAndUid(pno, u_id);
            System.out.println("wishlist : " + wishlist );
            if (wishlist != null) {
                model.addAttribute("like", 1);
            } else {
                model.addAttribute("like", 0);
            }

            CartVO cart = cartService.getCartByPnoAndUid(pno, u_id);
            System.out.println("cart : " + cart);
            if (cart != null) {
                model.addAttribute("cart", 1);
            } else {
                model.addAttribute("cart", 0);
            }
        }catch (Exception e){
            System.out.println("로그인 안해서 여기 진입 합니다.");
            productService.getProductContents(pno);
        }


        return "/board/read";
    }

    // 해당 상품을 찜 목록에 추가하는 기능
    @PostMapping("/wishlist/add")
    public ResponseEntity<String> addWishlist(WishlistVO vo, HttpSession session) {
        String id = (String) session.getAttribute("id");
        System.out.println("찜 컨트롤러에 아이디 불러오나?:"+vo);

        // 로그인한 사용자 정보가 없는 경우
        if (id == null) {
            return ResponseEntity.badRequest().body("로그인 후 이용해주세요.");
        }

        CustomerUserVO customerUserVO = customerService.getCustomerById(id);
        System.out.println("사용자 정보:"+customerUserVO);
        // 사용자 정보가 없는 경우
        if (customerUserVO == null) {
            return ResponseEntity.badRequest().body("사용자만 이용 가능합니다.");
        }
        WishlistVO wishlistVO = new WishlistVO();
        wishlistVO.setPno(vo.getPno());
        wishlistVO.setU_id(vo.getU_id());
        wishlistVO.setW_date(new Date());
        System.out.println("WISHLISTVO:" + wishlistVO);
        wishlistService.addWishlist(wishlistVO);

        return new ResponseEntity<>("찜 목록에 추가되었습니다.", HttpStatus.OK);
    }

    // 해당 상품을 찜 목록에서 삭제하는 기능
    @GetMapping("/wishlist/delete")
    public ResponseEntity<String> deleteWishlist(int pno, HttpSession session) {
        String id = (String) session.getAttribute("id");
        System.out.println("찜 삭제 컨트롤러에 pno 불러오나?:"+pno);
        // 로그인한 사용자 정보가 없는 경우
        if (id == null) {
            return new ResponseEntity<>("로그인 후 이용해 주세요.", HttpStatus.OK);
        }

        wishlistService.getWishlistByPnoAndUid(pno, id);
        wishlistService.deleteWishlist(pno, id);
        System.out.println("삭제 성공");

        // 찜 목록에서 해당 상품 삭제
        System.out.println(pno);
        System.out.println("상품번호 pno :" + pno);
        return new ResponseEntity<>("찜 목록에서 삭제되었습니다.", HttpStatus.OK);
    }

    // 해당 상품을 장바구니에 추가하는 기능
    @PostMapping(value = "/cart/add", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
    public ResponseEntity<String> addCart(@RequestBody Map<String, Object> cartData,HttpSession session) throws UnsupportedEncodingException {
        System.out.println("/CARD/ADD >>>>");
        System.out.println(">> " + cartData);

        ObjectMapper objectMapper = new ObjectMapper();
        CartVO cart = objectMapper.convertValue(cartData, CartVO.class);

        System.out.println("CART : " + cart);

        String id = (String) session.getAttribute("id");
//        System.out.println("장바구니 컨트롤러에 아이디 불러오나?:" + vo);

//         로그인한 사용자 정보가 없는 경우
        if (id == null) {
            return ResponseEntity.badRequest().body("로그인 후 이용해주세요.");
        }

        CustomerUserVO customerUserVO = customerService.getCustomerById(id);
        System.out.println("사용자 정보:" + customerUserVO);
        // 사용자 정보가 없는 경우
        if (customerUserVO == null) {
            return ResponseEntity.badRequest().body("사용자만 이용 가능합니다.");
        }

        cartService.addCart(cart);

        return new ResponseEntity<>("장바구니에 추가되었습니다.", HttpStatus.OK);
    }

    // 해당 상품을 장바구니에서 삭제하는 기능
    @GetMapping("/cart/delete")
    public ResponseEntity<String> deleteCart(int pno, HttpSession session) {
        String id = (String) session.getAttribute("id");
        System.out.println("장바구니 삭제 컨트롤러에 pno 불러오나?:"+pno);
        // 로그인한 사용자 정보가 없는 경우
        if (id == null) {
            return new ResponseEntity<>("로그인 후 이용해 주세요.", HttpStatus.OK);
        }

        cartService.getCartByPnoAndUid(pno, id);
        cartService.deleteCart(pno, id);
        System.out.println("삭제 성공");

        // 찜 목록에서 해당 상품 삭제
        System.out.println(pno);
        System.out.println("상품번호 pno :" + pno);
        return new ResponseEntity<>("장바구니에서 삭제되었습니다.", HttpStatus.OK);
    }

    //상단바 장바구니 진입 시 삭제 컨트롤러
    @PostMapping("/cart/delete")
    @ResponseBody
    public void deleteCart(@RequestBody List<Integer> pnoList, HttpSession session) {
        String id = (String) session.getAttribute("id");
        System.out.println("상단바 장바구니 삭제 컨트롤러: " + pnoList);
        for (int pno : pnoList) {
            System.out.println("pno: " + pno);
            cartService.getCartByPnoAndUid(pno, id);
            cartService.deleteCart(pno, id);
        }
    }
}