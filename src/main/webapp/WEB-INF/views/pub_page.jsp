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
        <!-- header -->
        <%@ include file="jspf/header.jspf" %>  
        <!-- /header -->
        <c:if test="${!empty pub }">
            
            <div class="comics_desc_wrapper">
                <div class="comics_img">
                    <img src="${pub.pub_logo_url }" height="150px" />
                </div>
                <div class="comics_desc">
                    <p><b>${pub.pub_name }</b></p>
                    <p>${pub.pub_country }</p>
                    <p>${pub.pub_site }</p>
                    <p>${pub.pub_desc }</p>
                </div>
            </div>
            <c:forEach items="${pub.comicsSet }" var="pop">
                <div class="comics_item">
                    <h3><a href="${pageContext.request.contextPath}/comics/${pop.comics_link}">${pop.comics_title }</a></h3>
                    <h4><a href="${pageContext.request.contextPath}/comics/${pop.comics_link}">${pop.comics_title_origin }</a></h4>
                    <div class="comics_desc_wrapper">
                        <div class="comics_img">
                            <img src="${pop.comics_cover_url }" height="150px" />
                        </div>
                        <div class="comics_desc">
                            <p><b>Художник:</b>
                                <c:forEach items="${pop.painters }" var="p">
                                    <a href="${pageContext.request.contextPath}/painter/${p.painter_link}">${p.painter_name }</a>
                                </c:forEach>
                            </p>
                            <c:if test="${!empty pop.comics_colorist }">
                                <p><b>Колорист:</b> ${pop.comics_colorist }</p>
                            </c:if>
                            <p><b>Тип:</b> ${pop.comics_type }</p>
                            <p><b>Издатель локализации:</b> <a href="${pageContext.request.contextPath}/localpub/${pop.localpublisher.lpub_link}">${pop.localpublisher.lpub_name }</a></p>
                            <p><b>Год выхода:</b> ${pop.comics_date_world_pub } <b>Год локализации:</b> ${pop.comics_date_ru_pub }</p>
                        </div>
                    </div>
                    <p>${pop.comics_description}</p>
                </div>
            </c:forEach>
        </c:if>
        </div>
    </body>
</html>