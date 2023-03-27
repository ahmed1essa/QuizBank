<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="bankQuestion.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="../assets/img/favicon.png" />
    <title>Admin Log In
  </title>
    <!--     Fonts and icons     -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
    <!-- Nucleo Icons -->
    <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
    <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
    <!-- Font Awesome Icons -->
    <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
    <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet" />
    <!-- CSS Files -->
    <link id="pagestyle" href="../assets/css/material-dashboard.css?v=3.0.0" rel="stylesheet" />
</head>
<body class="bg-gray-200">
    <div class="container position-sticky z-index-sticky top-0">
        <div class="row">
            <div class="col-12">

                <form id="form1" runat="server">



                    <div>
                        <h1>تسجيل الدخول
                        </h1>
                        <asp:Login ID="Login1" TextBoxStyle-Font-Bold="true"
                            TitleTextStyle-Font-Size="XX-Large"
                            FailureText="بيانات الدحول غير صحيحة"
                            TitleText="شاشة تسجيل الدخول"
                            UserNameLabelText="رقم الهاتف"
                            PasswordLabelText="كلمة المرور"
                            RememberMeText="تذكرني في المرة القادمة"
                            LoginButtonText="دخول"
                            runat="server">
                        </asp:Login>

                    </div>
                </form>
            </div>
        </div>
    </div>

    <!--   Core JS Files   -->
    <script src="../assets/js/core/popper.min.js"></script>
    <script src="../assets/js/core/bootstrap.min.js"></script>
    <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
    <script>
        var win = navigator.platform.indexOf('Win') > -1;
        if (win && document.querySelector('#sidenav-scrollbar')) {
            var options = {
                damping: '0.5'
            }
            Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
        }
  </script>
    <!-- Github buttons -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
    <script src="../assets/js/material-dashboard.min.js?v=3.0.0"></script>

</body>
</html>
