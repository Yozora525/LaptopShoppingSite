<%@ page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file = "connectsql.jsp"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("mem_account")==null || session.getAttribute("mem_account").equals("") ){
        response.sendRedirect("login.jsp");
    }
    else{
%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>付款</title>
        <!-- 引入jQuery -->
        <script src="../assets/js/lib/jquery/jquery.min.js"></script>
        <!-- 引入Echarts -->
        <script src="../assets/js/lib/echarts/echarts.min.js"></script>
        <!-- 引入jQuery-Confirm -->
        <script src="../assets/js/lib/jquery-confirm/jquery-confirm.min.js"></script>
        <link rel="stylesheet" href="../assets/js/lib/jquery-confirm/jquery-confirm.min.css" />
        <!-- 引入blockUI -->
        <script src="../assets/js/lib/blockUI/jquery.blockUI.js"></script>
        <!-- 引入login -->
        <script src="../assets/js/login.js"></script>
        <!-- 引入css -->
        <link rel="stylesheet" href="../assets/sass/common.css" />
        <link rel="stylesheet" href="../assets/sass/pay.css" />
        <!-- 引入自寫js -->
        <script src="../assets/js/loading.js"></script>
    </head>
<body>
    <header>
        <div style="text-align:right;background-color: #0096C7;">
        </div>
        <div class="guide-container">
            <nav class="nav-header">
                <div class="home" style="border:3px solid #ccc;">
                    <a href="index.jsp">多比店舖 | 結帳</a>
                </div>
            </nav>
        </div>
    </header>
    <main class="main">
        <div class="content">
            <div id="loading" style="display: none;">
                <img src="../assets/img/loading.gif">
            </div>
            <div class="pay-container">
                <div class="pay-title-container">
                    <div class="pay-title-order">
                        <span style="color: #000;">訂單商品</span>
                    </div>
                    <div class="pay-title">
                        <span>單價</span>
                    </div>
                    <div class="pay-title">
                        <span>數量</span>
                    </div>
                    <div class="pay-title">
                        <span>總價</span>
                    </div>
                </div>
                <form action="addorder.jsp" method="POST">
                    <!-- 訂單商品 -->
                    <%
                        request.setCharacterEncoding("UTF-8");
                        response.setCharacterEncoding("UTF-8");
                        
                        
                        String acc = session.getAttribute("mem_account").toString();
                        
                        sql = "SELECT `mem_id` FROM `login` WHERE `mem_account` ='" + acc + "'";
                        //sql = "SELECT `mem_id`,`mem_password` FROM `login` WHERE `mem_account` ='adsasddsa@gmail.com'";
                        ResultSet rs1 = con.createStatement().executeQuery(sql);
                        rs1.next();
                        String id = rs1.getString("mem_id");
                    %>
                    <%

                        int tprice=0;
                        String cname[] = request.getParameterValues("item-check");
                        
                        int ta = 0;
                        try {
                            ta = cname.length;
                        }
                        catch(Exception e){
                            response.sendRedirect("car.jsp");
                        }

                        int[] quan= new int[ta];
                        String[] pid = new String[ta];
                        int[] upri = new int[ta];

                        for(int i = 0 ; i < ta; i++ ){
                            sql="SELECT `product_id` FROM `product_infor` WHERE `product_name`='"+cname[i]+"'";
                            ResultSet rsid = con.createStatement().executeQuery(sql);
                            rsid.next();
                            pid[i] = rsid.getString("product_id");
                            
                            sql="SELECT `product_price` FROM `product_infor` WHERE `product_name`='"+cname[i]+"'";
                            ResultSet rsp = con.createStatement().executeQuery(sql);
                            rsp.next();
                            upri[i] = rsp.getInt("product_price");

                            sql = "SELECT `mem_id`, `product_id` ,`order_amount`";
                            sql += " FROM `cart`";
                            sql += "WHERE (`mem_id` = '"+id+"') AND (`product_id` = '"+pid[i]+"')";
                            ResultSet rs = con.createStatement().executeQuery(sql);
                            rs.next();
                                out.println("<div class='pay-item'>");
                                out.println("<div class='item-info-name'>");       
                                    out.println("<input class='' name='item-name' value='"+cname[i]+"' readonly/>");     
                                out.println("</div>");    
                                out.println("<div class='item-info'>");   
                                    out.println("<input class='' name='item-price' value='"+upri[i]+"' readonly/>");       
                                out.println("</div>");    
                                out.println(" <div class='item-info'>"); 
                                    out.println("<input class='' name='item-quan' value='"+rs.getInt("order_amount")+"' readonly/>");            
                                out.println("</div>");  
                                out.println("<div class='item-info'>");      
                                    out.println(" <input class=''name='item-revenue' value='"+upri[i]*rs.getInt("order_amount")+"' readonly/>");                            
                                out.println("</div>"); 
                                out.println("</div>"); 
                                tprice+=upri[i]*rs.getInt("order_amount");
                             quan[i]=rs.getInt("order_amount");
                        }  
                        int amount = 0;    
                        for(int i = 0; i < ta ; i++){
                            amount+=quan[i];
                        } 
                    %>
                    <div class="pay-checkout">
                        <div class="send-addr" style='width: 50%;' >
                            <input style='width: 50%;' type="text" class="" name="addr" placeholder="請輸入宅配地址" required/>
                        </div>
                        <div class="pay-revenue">
                        <%
                        int oprice = tprice;
                        if(amount>=2){
                            out.println("<input name='discount' value='任選兩件購物車9折'style='color:red;font-size:12px;font-weight: bold; border:none; width:120px;' readonly/> ");
                            //<span style='width: 80px;color:red;font-size:12px;'>任選兩件購物車9折</span>
                            tprice*=0.9;
                        }%></div>
                        <div class="pay-revenue"><%
                        out.println("<span style='width: 80px;font-size:12px;'>共 "+amount+" 件商品</span>");
                        %> </div> 
                         <div class="pay-revenue">
                         <span style="font-size:12px;">原價：</span>
                        <span style='border:none; width:80px;font-size:12px;'>
                           <input class='' name='oprice' value='<%=oprice%>'style='color: #0096C7;font-weight: bold; border:none; width:70px;' readonly/> 
                         </span></div> 
                        <div class="pay-revenue">
                            <span style="font-size:12px;">實際金額：</span>
                            <span name="pay-revenue" style="color: #0096C7;font-weight: bold;font-size:12px;">
                            <input class='' name="pay-revenue" value='<%=tprice%>'style="color: #0096C7;font-weight: bold; border:none; width:70px" readonly/></span>
                        </div>
                        <div class="pay-btn-container">
                            <button id="btn-checkout">結帳</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </main>
    <footer class="footer">
        <span class="copyright">&copy;</span>

    </footer>
</body>
</html>
<%}%>