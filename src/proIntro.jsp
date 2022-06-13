<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %> 
<%@include file = "connectsql.jsp" %> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>產品介紹</title>
    <!-- 引入jQuery -->
    <script src="../assets/js/lib/jquery/jquery.min.js"></script>
    <!-- 引入blockUI -->
    <script src="../assets/js/lib/blockUI/jquery.blockUI.js"></script>
    <!-- 引入自寫js -->
    <script src="../assets/js/loading.js"></script>
    <script src="../assets/js/product.js"></script>
    <!-- 引入css -->
    <link rel="stylesheet" href="../assets/sass/common.css" />
    <link rel="stylesheet" href="../assets/sass/proIntro.css" />
</head>
<body>
    <header>
        <div style="text-align:right;background-color: #0096C7;">
        <%
                if(session.getAttribute("mem_account")==null||session.getAttribute("mem_account").equals("")){
                    out.println("<a href='manage.jsp' class='manage'>網站管理</a>");
                }
                else{
                    out.println("<a href='logout_mem.jsp' class='manage'>登出</a>");
                }
            %>
        </div>
        <div class="guide-container">
            <nav class="nav-header">
                <div class="home" style="border:3px solid #ccc;">
                    <a href="index.jsp">多比店舖</a>
                </div>
                <div class="key-word-search">
                    <form method="GET" action="filter_search.jsp">
                        <input type="search" name="" placeholder="請輸入關鍵字">
                        <button style="background-color:transparent;border:0px"><img src="../assets/img/google-icon/ic_search_white_18dp.png"></button>
                    </form>
                </div>
                <div class="link-icon">
                    <%  String lurl;
                        if(session.getAttribute("mem_account")==null||session.getAttribute("mem_account").equals("")){
                            lurl = "login.jsp";
                        }
                        else{
                            lurl = "memInfo.jsp";
                        }
                    %>
                    <div class="icon-login">
                        <a  href="<%=lurl%>"><img src="../assets/img/google-icon/ic_account_circle_white_36dp.png"></a>
                    </div>
                    <div class="icon-contact">
                        <a  href="about.jsp"><img src="../assets/img/google-icon/ic_group_white_36dp.png"></a>
                    </div>
                    <div class="icon-car">
                        <a  href="car.jsp"><img src="../assets/img/google-icon/ic_shopping_cart_white_36dp.png"></a>
                    </div>
                </div>
            </nav>
        </div>
    </header>

<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");    
    String pname = request.getParameter("proID");                                        
    String sqlinfo = "SELECT * FROM `product_infor` WHERE product_id='" + pname + "'"; 
    ResultSet rs = con.createStatement().executeQuery(sqlinfo);
    String sqlp = "SELECT * FROM `product_img` WHERE product_id='" + pname + "'"; 
    ResultSet rs1 = con.createStatement().executeQuery(sqlp);
    String sqlcomment = "SELECT * FROM `comment`, `mem_infor` WHERE product_id='" + pname + "' AND (comment.mem_id=mem_infor.mem_id) ORDER BY `comment_time` DESC";
    ResultSet rscomment = con.createStatement().executeQuery(sqlcomment);

    %>

    <main class="main">
        <div class="content">
            <div id="loading" style="display: none;">
                <img src="../assets/img/loading.gif">
            </div>
        </div>
        <% if(rs1.next()){ %>
        <div class="pro-container">
            <div class="pro-img-container">
                <div class="img-up">
                    <div class="img">
                        <img id="img-show" src="<%=rs1.getString("img_link")%>" />
                    </div>
                </div>
                <div class="img-down">
                    <div class="img-down-container">
                        <div>
                            <img name="img-list" src="<%=rs1.getString("img_link")%>" />
                        </div>
                        <div>
                            <img name="img-list" src="<%=rs1.getString("img_link_two")%>" />
                        </div>
                    </div>
                </div>
            </div>
            <%}%>
             <%if(rs.next()){%>
            <div class="pro-info-container">
                <div class="pro-name">
                    <span><%=rs.getString("product_name")%></span>
                </div>
                <div class="pro-sold-quan">
                    <span><%=rs.getInt("product_sold")%></span> <!-- 從資料庫抓 -->
                    <span style="color: #bbb;">已賣出</span>
                </div>
                <div class="pro-price">
                    <span>$<%=rs.getInt("product_price")%></span>
                </div>
                <div class="pro-inventory">
                    <span>存貨：</span>
                    <span id="inventory"><%=rs.getInt("product_amount")%></span>
                </div>
                <%}%>
                <%out.println("<form>");%>
                <div class="pro-quan">
                    <span>數量：</span>
                    <button id="minus" type="button">-</button>
                    <input type="text" id="quan" name="quantity" value="1" oninput = "value=value.replace(/[^\d]/g,'')" />
                    <button id="plus" type="button">+</button> 
                </div>
                
                <div class="pro-btn-container">
                    <div> 
                    <%out.println("<input type='text' value='"+pname+"'  style='display: none;' name='proID' readonly/>");%>
                        <button type="submit" formaction="addtocart.jsp"><img src="../assets/img/google-icon/ic_add_shopping_cart_white_18dp.png" />加到購物車</button>
                        <button type="submit" formaction="buynow.jsp">直接購買</button>
                    <%out.println("</form/>");%>
                    </div>
                </div>
                
            </div>
        </div>
         
        <!-- 商品介紹 -->
        <div class="pro-intro-container">
            <div class="pro-intro-title">
                <span>商品詳情</span>
            </div>
            <div class="pro-intro-content">
                <span><%=rs.getString("product_discript")%></span>
            </div>
        </div>
        <!-- 商品評價 -->
        <div class="pro-eval-container">
            <div class="pro-intro-title">
                <span>商品評價</span>
            </div>
            <!-- 個別用戶評價 -->
            <%                               
                   while(rscomment.next()){ 
                    out.println("<div class='pro-eval'>");
                    out.println("<div class='eval-user'>");      
                    out.println("<span>"+rscomment.getString("mem_name")+"</span>");      
                    out.println("</div>");                      
                    out.println("<div class='eval-info'>"); 

                    for(int s=0; s<rscomment.getInt("star"); s++)
                    out.println("<span class='eval-star'>★</span>");

                    out.println("</div>");
                    out.println("<div class='eval-info'>");
                    out.println("<span>"+rscomment.getString("comment_time")+"</span>");
                    out.println("</div>");
                    out.println("<div class='eval-content'>");
                    out.println("<span>"+rscomment.getString("mem_comment")+"</span>");
                    out.println("</div>");
                    out.println("</div>");
                   }
                    
            %>
        </div>
        <div class="new-eval-container">
            <div class="pro-intro-title" style="text-align:center;">
                <span>評價</span>
            </div>
            <%out.println("<form action='comment.jsp' method='get'>");%>
                <div class="new-eval-star">
                    <span class="eval-star" name="new-eval-star" data-star="1">★</span>
                    <span style="color: #ddd;" name="new-eval-star" data-star="2">★</span>
                    <span style="color: #ddd;"  name="new-eval-star" data-star="3">★</span>
                    <span  style="color: #ddd;" name="new-eval-star" data-star="4">★</span>
                    <span  style="color: #ddd;" name="new-eval-star" data-star="5">★</span>
                    <input type="text" value="1"  style="display: none;" name="eval-star" readonly/>
                    <%out.println("<input type='text' value='"+pname+"'  style='display: none;' name='procID' readonly/>");%>
                </div>
                <div class="new-eval-content">
                    <textarea name="memcomment" minlength="10" maxlength="512" required></textarea>
                </div>
                <div class="btn-container">
                    <input type="submit" value="送出評價" />
                </div>
            </form>
        </div>
    </main>
    <footer class="footer">
        <span class="copyright">&copy;</span>
    </footer>
</body>
</html>

