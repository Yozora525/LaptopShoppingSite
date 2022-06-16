# ISSUE #
### 完成後請在需求最後方標上日期 ###

## 資料表 ##
    1. 需新增一張表存管理員的資料 e.g. 帳密... 20220528_daiyun

## 所有頁面 ##
    1. 判斷登入和會員 / 管理與登出 之按鈕顯示                           20220611_daiyun
    2. 套用在所有版面                                                
    3. 把所有標籤是.html的改成.jsp                                     20220613_daiyun
    4. footer記得改 把有顯示頁面的丟到tempelate 然後我們就要開始改超連結了q
## 首頁 ##
    1. 列出商品... 202205_JLC
    2. 排行榜用連結... 20220610_JLC
    3. 商品總覽連結... 20220610_JLC
    4. 訪客人數... 20220613_JLC

## 搜索頁 ##
    1. 導覽列需要查詢功能，輸入關鍵字可查詢相關的商品... 20220610_JLC
    2. 商品篩選... 20220608_JLC
    3. 連結... 20220610_JLC

## 產品頁 ##
    1. 產品詳情匯入... 20220611_JLC
    2. 匯入評論區... 20220610_JLC
    3. 留言板... 20220612_JLC
    4. 新增進購物車... 20220612_JLC
    5. 直接結帳... 20220612_JLC

## 登入/註冊 ## 20220611_daiyun
    1. 註冊時製造會員ID          catchDateRan.jsp+reg_mem.jsp         20220528_daiyun
    2. 新增會員                  reg_mem.jsp                          20220611_daiyun
    3. 登入確認                  login_mem.jsp                        20220611_daiyun
    4. 登出                      logout_mem.jsp                      20220611_daiyun

    #需求#
  X 1. 前端會將登入/註冊的資訊利用ajax的方式傳至後端，後端處理完成請利用json格式回傳結果，e.g. {'res':'', 'data':[], 'msg': ''}
        * res 回傳 success or fail
        * data 回傳資料，格式請用list(Array)回傳 e.g. 'data':[[1,2,3],[4,5,6]]
        * msg 回傳錯誤訊息，當 res == fail 才會有
  O 2. 註冊完跳到會員中心填資料  alert
  O 3. 判斷會員新增的帳密跟製造的id是否重複
  O 4. 流水號後三碼維持三位
## 購物車 ## 20220612_daiyun
    1. 匯入欲購買商品           列於 car.jsp                          20220604_daiyun 
    1. 刪除欲購買商品           cardelete.jsp                        20220611_daiyun
    2. 更改商品數量             caramount.jsp                        20220611_daiyun
    3. 新增訂單(清單、詳情)     addorder.jsp                          20220612_daiyun
    4. 顯示訂單                列於car.jsp                           20220612_daiyun           
    5. 製造訂單id              catchDateRan.jsp+addorder.jsp         20220612_daiyun 
    6. 購物車停留30天           列於car.jsp                           20220616_daiyun 

    #需求#
  O 1. 刪除購物車內容功能，當使用者點選刪除時，刪除資料表的資料 // 前端會用ajax傳商品名稱過去，記得刪除後要回傳結果至前端 
       => executeUpdate()回傳值不知為何 < 0，因此添加!crs.next()判斷其是否有成功刪除
  O 2. 檢查數量是否超過存貨 // 更改數量ajax接 丟進資料庫前要先判斷 購買數量>存貨 res = fail msg 購買數量超過庫存 
       => 在一開始的訂單介面限制
  O 3. 目前可顯示但無法更改數字  
  O 4. 付款介面 跳pay 新增完跳finish.jsp 
  O 5. 增加訂單時同時減少庫存 還要去掉car裡的商品 
## 後台 ##  20220611_daiyun
    1. 上下架                  pullsheleve.jsp                      20220611_daiyun
    2. 新增產品                addCommo.jsp+addPro.jsp              20220604_daiyun
    3. 商品訂單匯入            列於backstage.jsp                     20220604_daiyun
    4. 訂單篩選                searchresult.jsp                     20220604_daiyun
    5. 管理員登入              login_man.jsp                        20220611_daiyun
    6. 管理員登出              logout_man.jsp                       20220611_daiyun
    #需求#
  O 1. 更改上下架按鈕名稱 -- daiyun0611
  O 2. addPro.jsp修正不可為空 -- daiyun0613
  O 3. 檢查新增商品名稱不可重複 -- daiyun0613
## 會員中心 ## 20220611_daiyun 0613bug修正
    1. 更改個人資料            changeinfo.jsp                       20220611_daiyun
    2. 變更密碼                changepwd.jsp                        20220611_daiyun
    3. 購買紀錄匯入            列於memInfo.jsp                       20220611_diayun  
    4. 評論紀錄                列於memInfo.jsp                   ... 20220611_JLC
    #需求#
  O 1. 列出訂單清單後用url連接到訂單詳情 -- daiyun0612
  O 2. 信箱已註冊顯示此信箱已註冊 跳回登入 -- daiyun0613
  O 3. 生日僅可輸入一次                   -- daiyun0613
  O 4. 手機號碼檢查是否為09開頭 是否為10碼 -- daiyun0613
## prevent sql injection ##
  O 1. 後台新增商品                      -- daiyun0613
  O 2. 會員基本資料修改                   -- daiyun0613
  O 3. 會員中心變更密碼                   -- daiyun0613
  O 4. 會員中心購買紀錄GET傳值            -- daiyun0613
  O 5. pay.jsp配送地址                   -- daiyun0613
    6. 導覽列搜尋 (searchresult.jsp)   ... 20220614_JLC
    7. 篩選商品 (filter.jsp)           ... 20220614_JLC 
    8. 留言板 (comment.jsp)           ... 20220614_JLC
  O 9. 登入註冊                          -- daiyun0613
    10.傳值GET到產品頁面(proIntro.jsp) ... 20220614_JLC
    11.加入購物車GET傳值(addtocart).jsp)... 20220614_JLC
    12.直接結帳GET傳值(buynow.jsp)      ... 20220614_JLC