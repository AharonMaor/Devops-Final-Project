<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" %>

<%!
    ArrayList<String> todoList = new ArrayList<String>();
    ArrayList<String> completedList = new ArrayList<String>();
%>

<!DOCTYPE html>
<html>
<head>
<title>To-Do List Application!!</title>
<style>
body {
    background-color: green;
}
</style>
</head>
<body>
    <h1>To-Do List Application</h1>
    <%
        String message = "";
        if(request.getMethod().equals("POST")) {
            if(request.getParameter("add") != null) {
                String task = request.getParameter("task");
                todoList.add(task);
                message = "Task added Successfully";
            } else if(request.getParameter("complete") != null) {
                int index = Integer.parseInt(request.getParameter("index"));
                completedList.add(todoList.get(index));
                todoList.remove(index);
                message = "Task marked as completed";
            }
        }
    %>
    <p>To-Do List:</p>
    <ul>
        <%
            for(int i = 0; i < todoList.size(); i++) {
                out.println("<li>" + todoList.get(i) + "</li>");
            }
        %>
    </ul>
    <p>Completed Tasks:</p>
    <ul>
        <%
            for(int i = 0; i < completedList.size(); i++) {
                out.println("<li>" + completedList.get(i) + "</li>");
            }
        %>
    </ul>
    <p><%=message%></p>
    <form action="<%=request.getRequestURI()%>" method="post">
        <label for="task">Enter a new task:</label>
        <br>
        <input type="text" id="task" name="task">
        <br>
        <input type="submit" value="Add Task" name="add">
    </form>
    <form action="<%=request.getRequestURI()%>" method="post">
        <label for="index">Enter index of task to mark as completed:</label>
        <input type="text" id="index" name="index">
        <br>
        <input type="submit" value="Mark as Completed" name="complete">
    </form>
</body>
</html>
