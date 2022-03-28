<%@ page pageEncoding="utf-8" %>
<script>
    alert('${param.msg}');
    location.href='<%=request.getContextPath()%>${param.url}?page=1&rows=10'
</script>