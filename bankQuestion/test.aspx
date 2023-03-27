<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="bankQuestion.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head runat="server">
    <title></title>
    <style>
        /**
 * CSS from the Layout Generator/Tool
 */
        .container {
            display: flex;
            flex-direction: column;
        }

        .container__main {
            /* Take the remaining height */
            flex-grow: 1;
            /* Layout the left sidebar, main content and right sidebar */
            display: flex;
            flex-direction: row;
        }

        .container__left {
            width: 10%;
        }

        .container__middle {
            /* Take the remaining width */
            flex-grow: 1;
        }

        .container__right {
            width: 3%;
        }

        /**
 * Custom CSS added here 
 */
        body {
            font-family: "Raleway", sans-serif;
            padding: 1rem;
        }

        .container {
            max-width: 980px;
            height: calc(100vh - 3rem);
            margin: 0 auto;
            gap: 1rem;
        }

            .container header,
            .container footer,
            .container__main > * {
                display: grid;
                place-content: center;
                padding: 1rem;
                border-radius: 5px;
                font-size: 1rem;
                letter-spacing: 0.05rem;
                box-shadow: 0 1px 6px 0 hsl(0, 0%, 0%, 20%);
            }

        header, footer {
            color: hsl(22, 78%, 26%);
            background-color: hsl(48, 96%, 89%);
        }

        aside, nav {
            color: hsl(177, 51%, 23%);
            background-color: hsl(177,51%, 82%);
        }

        article {
            color: hsl(177, 51%, 23%);
            background-color: hsl(177, 51%, 93%);
        }

        .container__main {
            gap: 1rem;
            min-height: 185px;
        }

        @media (max-width: 600px) {
            .container__main {
                flex-wrap: wrap;
            }

            .container__left, .container__right {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header>
                Header
            </header>
            <main class="container__main">
                <!-- Left sidebar -->
                <aside class="container__left">Sidebar</aside>

                <!-- Main content -->
                <article class="container__middle">Content</article>

                <!-- Right sidebar -->
                <nav class="container__right">Nav</nav>
            </main>
            <footer>
                Footer
            </footer>
        </div>
    </form>
</body>
</html>
