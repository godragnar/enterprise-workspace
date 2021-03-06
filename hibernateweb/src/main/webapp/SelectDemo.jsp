<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.query.Query,
                    org.hibernate.*,
                    org.hibernate.cfg.Configuration,
                    com.wipro.velocity.User,
                    java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HQL</title>
</head>
<body>
<h1>HQL - Hibernate Query Language</h1>
<h2>HQL Select Query</h2>

    <%
    Configuration cfg = new Configuration();
    cfg.configure("hibernate.cfg.xml");
    SessionFactory factory = cfg.buildSessionFactory();
    Session sess= factory.openSession();
    sess.beginTransaction();
    
    Query<User> qry=sess.createQuery("from User");// Querying user POJO class
    
    List<User> lst    =(List<User>)qry.list();
    
    out.println("<h3>List of Employees:</h3>"+"<br>");
    for(User st:lst)
    {
        out.println(st.getId()+" "+st.getName()+" "+st.getEmail()+"<br>");
    }
    out.println("<br/>");
    
    //parameter queries
    qry=sess.createQuery("from User U where U.id=:id");
    qry.setInteger("id", 4);
    List<User> list3 = (List<User>) qry.list();
    out.println("List of Employees with Criteria::"+"<br>");
    for (User st : list3) {
        out.println(st.getId() + ","+ st.getName() + "," + st.getEmail()+"<br>");
    }
    
    //HQL aggregate functions - sum,max,min,count
    
    out.println("<br/>");
    Query qry1=sess.createQuery("select count(*) from User");
    List<Integer> lst2=qry1.list();
    out.println("Total Employees is : "+lst2.get(0));
    
    //HQL Pagination example
    
    qry=sess.createQuery("from User"); //Querying  User pojo class
    qry.setFirstResult(0);
    qry.setMaxResults(2);
    List<User> lst3    =(List<User>)qry.list();
  
    out.println("<h3>Paginated List of Employees:</h3>"+"<br>");
    for(User st:lst3)
    {
        out.println(st.getId()+" "+st.getName()+" "+st.getEmail()+"<br>");
    }
    out.println("<br/>");
    %>

</body>
</html>