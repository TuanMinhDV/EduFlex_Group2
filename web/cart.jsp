<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>CART</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body {
                margin-top: 20px;
                background: #eee;
            }

            .ui-w-40 {
                width: 40px !important;
                height: auto;
            }

            .card {
                box-shadow: 0 1px 15px 1px rgba(52, 40, 104, .08);
            }

            .ui-product-color {
                display: inline-block;
                overflow: hidden;
                margin: .144em;
                width: .875rem;
                height: .875rem;
                border-radius: 10rem;
                -webkit-box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.15) inset;
                box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.15) inset;
                vertical-align: middle;
            }
        </style>
    </head>
    <body>

        <div class="container px-3 my-5 clearfix">
            <div class="card">
                <div class="card-header">
                    <h2>Shopping Cart</h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered m-0">
                            <thead>
                                <tr>
                                    <th class="text-center py-3 px-4" style="min-width: 400px;">Subject Name </th>
                                    <th class="text-right py-3 px-4" style="width: 100px;">Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${cart.items}">
                                    <tr>
                                        <td class="p-4">
                                            <div class="media align-items-center">

                                                <img 
                                                    <c:if test="${item.orderSubject.image eq null}">
                                                        src="data:image/jpeg;base64,${item.orderSubject.image}"
                                                    </c:if>
                                                    <c:if test="${item.orderSubject.image ne null}">
                                                        src="data:image/jpeg;base64,${item.orderSubject.image}"
                                                    </c:if> 
                                                    class="d-block ui-w-40 ui-bordered mr-4" alt="Subject Image">

                                                <div class="media-body">
                                                    <a href="subjectdetail?category_id=${item.orderSubject.category_id}&subject_id=${item.orderSubject.subject_id}" class="d-block text-dark">${item.orderSubject.subject_name}</a>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-right font-weight-semibold align-middle p-4">${item.orderSubject.price*(1-item.orderSubject.discount/100)}</td>
                                        <td class="text-center align-middle px-0">
                                            <a href="/EduFlex_Demo3/removeitem?subject_id=${item.orderSubject.subject_id}" class="shop-tooltip close float-none text-danger">×</a>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>

                    <div class="d-flex flex-wrap justify-content-between align-items-center pb-4">
                        <div class="mt-4">
                            <label class="text-muted font-weight-normal"></label>
                        </div>
                        <div class="d-flex">
                            <c:set var="totalMoney" value="0" />
                            <c:forEach var="item" items="${cart.items}">
                                <c:set var="totalMoney" value="${totalMoney + item.orderSubject.price*(1-item.orderSubject.discount/100)}" />
                            </c:forEach>
                            <div class="text-right mt-4 mr-5">                         
                                <label class="text-muted font-weight-normal m-0">Total money</label>
                                <div class="text-large"><strong>${totalMoney}</strong></div>
                            </div>
                        </div>
                    </div>
                    <div class="float-left">
                        <a type="button" href="home.jsp?updatedCart=${updatedCart}" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3">Back to shopping</a>
                    </div>
                    <div class="float-right">
                        <form action="authorize_payment" method="post">
                            <input  class="btn btn-lg btn-primary mt-2" type="submit" value="Checkout" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>
