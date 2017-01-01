<%@ page import="java.util.Random" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/12/31
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <%
      if(request.getParameter("group")!=null) {
          //定义人名数组
          String[] name = {"张三", "李四", "王五", "小八", "小一", "老二", "赵六", "田七", "九九", "十头"};
          Integer group = new Integer(request.getParameter("group"));
          Integer loop = name.length / group;
          Integer yu = name.length % group;
          List<Integer> list = new ArrayList<Integer>();
          Integer tep = 0;
          Integer tem = 0;

          //将数组下标设置成随机数，就可以实现人名的随机抽取
          for (int i = 1; i <= name.length; i++) {
              //随机生成数组下标
              int rand = (int) (Math.random() * name.length);

              // 去重
              if (!list.contains(rand)) {
                  list.add(rand);
                  out.print(name[rand] + "，");
                  if(yu == 0) { // 如果余数等于零
                      if (i % loop == 0) {
                          out.print("<br />");
                      }
                  } else {  // 余数不等于零
                      if (tep < yu) {
                          if (i % (loop + 1) == 0) {
                              tep++;
                              out.print("<br />");
                          }
                      } else {
                          tem++;
                          if(tem % loop == 0) {
                              out.print("<br />");
                          }
                      }
                  }
              } else {
                  i--;
              }
          }
      }
  %>
  <body>
    <form method="post" action="index.jsp">
        组数：<input type="text" name="group"/><br/>
      <input type="submit" value="提交" />
    </form>
  </body>
</html>