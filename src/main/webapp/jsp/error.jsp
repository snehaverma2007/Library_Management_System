<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Server Error - Library Management</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display&family=Manrope:wght@400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common.css">

<style>

    .error-wrap {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 72px 24px 32px;
        background:
            radial-gradient(700px 420px at 50% -5%, rgba(236, 208, 142, .38), transparent 70%),
            radial-gradient(900px 600px at 50% 120%, rgba(0, 0, 0, .45), transparent 70%),
            var(--grain),
            linear-gradient(180deg, var(--wood-700) 0%, var(--wood-900) 100%);
    }

    /* ---------- Card: cream paper with a brass frame ---------- */
    .error-card {
        position: relative;
        width: 100%;
        max-width: 480px;
        padding: 0 40px 38px;
        text-align: center;
        background: var(--surface);
        border: 1.5px solid var(--border-strong);
        border-radius: var(--radius-lg);
        box-shadow:
            0 0 0 6px rgba(201, 151, 44, .18),
            0 30px 60px -18px rgba(0, 0, 0, .7);
        animation: errRise .6s var(--ease) both;
    }

    @keyframes errRise {
        from { opacity: 0; transform: translateY(22px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    .error-card::before {
        content: "";
        position: absolute;
        inset: 10px;
        border: 1px solid var(--border);
        border-radius: calc(var(--radius-lg) - 8px);
        pointer-events: none;
    }

    /* Solid brass circle on the top edge of the card */
    .error-icon {
        position: relative;
        width: 86px;
        height: 86px;
        margin: -43px auto 18px;
        display: grid;
        place-items: center;
        border-radius: 50%;
        font-size: 2.3rem;
        color: var(--wood-900);
        background: linear-gradient(145deg, var(--brass-300) 0%, var(--brass-500) 55%, var(--brass-600) 100%);
        border: 6px solid var(--surface);
        box-shadow: var(--shadow-badge);
    }

    .error-code {
        margin: 0;
        font-family: var(--font-display);
        font-size: 5.2rem;
        font-weight: 400;
        line-height: 1;
        letter-spacing: .04em;
        color: var(--wood-800);
    }

    /* Burgundy rule signals "error" while staying in the palette */
    .error-rule {
        width: 64px;
        height: 4px;
        margin: 14px auto 18px;
        border-radius: 4px;
        background: linear-gradient(90deg, var(--burgundy-500), var(--burgundy-700));
    }

    .error-title {
        margin: 0 0 10px;
        font-family: var(--font-display);
        font-size: 1.7rem;
        font-weight: 400;
        color: var(--wood-800);
    }

    .error-message {
        margin: 0 auto 28px;
        max-width: 390px;
        font-size: .96rem;
        line-height: 1.65;
        color: var(--text-soft);
    }

    /* ---------- Buttons ---------- */
    .error-actions a,
    .error-actions button {
        min-width: 180px;
        justify-content: center;
        text-align: center;
    }

    .error-actions .btn-cancel {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        background: transparent;
        cursor: pointer;
    }

    .error-actions .btn-cancel i {
        color: var(--brass-600);
    }

    @media (max-width: 480px) {
        .error-card { padding: 0 24px 30px; border-radius: 20px; }
        .error-code { font-size: 4.2rem; }
        .error-title { font-size: 1.45rem; }
    }
</style>
</head>
<body>

<div class="error-wrap">
    <div class="error-card">
        <div class="error-icon"><i class="bi bi-exclamation-triangle-fill"></i></div>

        <h2 class="error-code">500</h2>
        <div class="error-rule"></div>
        <h1 class="error-title">Something Went Wrong</h1>
        <p class="error-message">
            The librarian hit a snag while handling your request. Nothing you did caused this.
            Please try again in a moment, or head back to a page you know.
        </p>

        <div class="error-actions d-flex flex-column flex-sm-row justify-content-center gap-3">
            <a href="AuthenticationController?action=showLogin" class="btn-modern">
                <i class="bi bi-speedometer2"></i>Back to Login
            </a>
            <button type="button" class="btn-cancel" onclick="history.back()">
                <i class="bi bi-arrow-counterclockwise"></i>Go Back
            </button>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

