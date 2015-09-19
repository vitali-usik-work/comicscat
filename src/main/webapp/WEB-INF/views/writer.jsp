<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf8">
        <title>comicscat</title>
        <link href="${pageContext.request.contextPath}/resources/css/test_style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div class="wrapper">
        <h1><a href="${pageContext.request.contextPath}">Hello, World! Comicscat is here!</a></h1>
        <c:if test="${!empty writer }">
            <p>${writer.writer_name }</p>
            <p>${writer.writer_bio }</p>
            <p>${writer.writer_nationality }</p>
            <c:forEach items="${writer.listComics }" var="pop">
                <div class="comics_item">
                    <h3><a href="${pageContext.request.contextPath}/comics/${pop.comics_link}">${pop.comics_title }</a></h3>
                    <h4><a href="${pageContext.request.contextPath}/comics/${pop.comics_link}">${pop.comics_title_origin }</a></h4>
                    <div class="comics_desc_wrapper">
                        <div class="comics_img">
                            <img src="${pop.comics_cover_url }" height="150px" />
                        </div>
                        <div class="comics_desc">
                            <p><b>Художник:</b> ${pop.comics_painter }</p>
                            <c:if test="${!empty pop.comics_colorist }">
                                <p><b>Колорист:</b> ${pop.comics_colorist }</p>
                            </c:if>
                            <p><b>Тип:</b> ${pop.comics_type }</p>
                            <p><b>Издатель:</b> ${pop.comics_publisher_origin } <b>Издатель локализации:</b> ${pop.comics_publisher_ru }</p>
                            <p><b>Год выхода:</b> ${pop.comics_date_world_pub } <b>Год локализации:</b> ${pop.comics_date_ru_pub }</p>
                        </div>
                    </div>
                    <p>${pop.comics_description}</p>
                    <p></p>
                    
                </div>
            </c:forEach>
        </c:if>
        </div>
    </body>
</html>