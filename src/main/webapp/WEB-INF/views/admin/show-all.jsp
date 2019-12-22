<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@include file="../header.jsp" %>

<div class="site-wrapper admin-panel">

    <div class="main-wrapper">

        <div class="top-bar-wrap">
            <div class="container">
                <div class="top-bar">
                    <a href="${pageContext.request.contextPath}/">
                        <div class="logo txt">Oferty pracy IT</div>
                    </a>

                    <ul class="top-menu">

                        <li><a href="${pageContext.request.contextPath}/post/show-all">Oferty pracy</a></li>

                        <c:if test = "${not empty loggedInUser.name}">
                            <li><a href="${pageContext.request.contextPath}/post/add">Dodaj ofertę</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/show-all">Panel administracyjny</a></li>
                            <li><a href="${pageContext.request.contextPath}/logout">Wyloguj: <span>${loggedInUser.name} ${loggedInUser.lastName}</span></a></li>
                        </c:if>

                        <c:if test = "${empty loggedInUser.name}">
                            <li><a href="${pageContext.request.contextPath}/register">Zarejestruj</a></li>
                            <li><a href="${pageContext.request.contextPath}/login">Zaloguj</a></li>
                        </c:if>

                    </ul>
                </div>
            </div>

        </div>

        <section class="main-content">

            <div class="container">

                <div class="row">

                    <div class="col col-sm-8 content">

                        <div class="inner-col">

                            <div class="heading-title">
                                <h3>Lista Twoich ofert pracy:</h3>
                            </div>

                            <div class="job-wrap">

                                <table class="table-responsive">
                                    <tr>
                                        <th>Stanowisko</th>
                                        <th>Miejscowość</th>
                                        <th></th>
                                        <th></th>
                                    </tr>

                                    <c:forEach items="${posts}" var="post">
                                        <tr>
                                            <td><h4><a href="${pageContext.request.contextPath}/post/${post.id}">${post.title}</a></h4></td>
                                            <td>
                                                <span class="showall-location">${post.location}</span>
                                            </td>
                                            <td>
                                                <a class="edit" href="${pageContext.request.contextPath}/admin/edit/${post.id}"><i class="fa fa-edit"></i> Edytuj</a>
                                            </td>
                                            <td>
                                                <a class="delete" href="${pageContext.request.contextPath}/admin/delete/${post.id}"><i class="fa fa-trash"></i> Usuń</a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </table>

                            </div>

                            <div class="navigation">
                                <div class="btns-wrap">
                                    <a href="${pageContext.request.contextPath}/" class="btn btn-back" style="margin-right: 10px;">powrót do strony głównej</a>
                                </div>
                            </div>

                        </div>

                    </div>

                    <div class="col col-sm-4 sidebar">

                        <div class="inner-col">

                            <div class="heading-title">
                                <h3>Tagi</h3>
                            </div>

                            <ul class="sidebar-list">
                                <li><a class="tag-item" href="${pageContext.request.contextPath}/"><i class="fa fa-angle-right" aria-hidden="true"></i>Java</a></li>
                                <li><a class="tag-item" href="${pageContext.request.contextPath}/"><i class="fa fa-angle-right" aria-hidden="true"></i>PHP</a></li>
                                <li><a class="tag-item" href="${pageContext.request.contextPath}/"><i class="fa fa-angle-right" aria-hidden="true"></i>JavaScript</a></li>
                                <li><a class="tag-item" href="${pageContext.request.contextPath}/"><i class="fa fa-angle-right" aria-hidden="true"></i>C#</a></li>
                                <li><a class="tag-item" href="${pageContext.request.contextPath}/"><i class="fa fa-angle-right" aria-hidden="true"></i>Python</a></li>
                            </ul>

                            <hr>

                            <div class="heading-title">
                                <h3>Miasta</h3>
                            </div>

                            <ul class="sidebar-list">
                                <li><a class="tag-item" href="${pageContext.request.contextPath}/"><i class="fa fa-angle-right" aria-hidden="true"></i>Kraków</a></li>
                                <li><a class="tag-item" href="${pageContext.request.contextPath}/"><i class="fa fa-angle-right" aria-hidden="true"></i>Warszawa</a></li>
                                <li><a class="tag-item" href="${pageContext.request.contextPath}/"><i class="fa fa-angle-right" aria-hidden="true"></i>Wrocław</a></li>
                                <li><a class="tag-item" href="${pageContext.request.contextPath}/"><i class="fa fa-angle-right" aria-hidden="true"></i>Gdańsk</a></li>
                                <li><a class="tag-item" href="${pageContext.request.contextPath}/"><i class="fa fa-angle-right" aria-hidden="true"></i>Poznań</a></li>
                            </ul>

                            <hr>

                            <div class="heading-title">
                                <h3>Kategorie</h3>
                            </div>

                            <ul class="sidebar-list">
                                <li><a class="tag-item" href="${pageContext.request.contextPath}/"><i class="fa fa-angle-right" aria-hidden="true"></i>Front-end</a></li>
                                <li><a class="tag-item" href="${pageContext.request.contextPath}/"><i class="fa fa-angle-right" aria-hidden="true"></i>Full-stack</a></li>
                                <li><a class="tag-item" href="${pageContext.request.contextPath}/"><i class="fa fa-angle-right" aria-hidden="true"></i>Back-end</a></li>
                                <li><a class="tag-item" href="${pageContext.request.contextPath}/"><i class="fa fa-angle-right" aria-hidden="true"></i>Tester</a></li>
                                <li><a class="tag-item" href="${pageContext.request.contextPath}/"><i class="fa fa-angle-right" aria-hidden="true"></i>Administrator</a></li>
                            </ul>

                        </div>

                    </div>

                </div>

            </div>

        </section>

    </div>

</div>


<%@include file="../footer.jsp" %>