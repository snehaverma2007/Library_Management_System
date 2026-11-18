<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="includes/header.jsp" %>
<style>
    /* ---------- Info card + user type cards ---------- */
	.info-card {
	    margin-bottom: 2rem;
	    padding: 1.5rem;
	    background: linear-gradient(135deg, rgba(236, 208, 142, .35) 0%, rgba(201, 163, 123, .22) 100%);
	    border: 1.5px solid var(--border-strong);
	    border-left: 5px solid var(--brass-500);
	    border-radius: var(--radius-md);
	    color: var(--text-body);
	}
	
	.info-card .icon {
	    margin-bottom: 1rem;
	    font-size: 2rem;
	    color: var(--brass-600);
	}
	
	.user-type-card {
	    margin-bottom: 1rem;
	    padding: 1.5rem;
	    cursor: pointer;
	    background: var(--surface);
	    border: 2px solid var(--border);
	    border-radius: var(--radius-md);
	    transition: border-color var(--base) var(--ease),
	                background var(--base) var(--ease),
	                transform var(--base) var(--ease),
	                box-shadow var(--base) var(--ease);
	}
	
	.user-type-card:hover {
	    transform: translateY(-2px);
	    background: #fff7e6;
	    border-color: var(--brass-400);
	    box-shadow: var(--shadow-card);
	}
	
	.user-type-card.selected {
	    background: #f7e6c2;
	    border-color: var(--brass-500);
	    box-shadow: var(--shadow-card), inset 5px 0 0 var(--brass-500);
	}
	
	.user-type-card .icon {
	    margin-bottom: 1rem;
	    font-size: 2.5rem;
	    color: var(--wood-500);
	    transition: color var(--fast) ease;
	}
	
	.user-type-card:hover .icon,
	.user-type-card.selected .icon {
	    color: var(--brass-600);
	}
	
	.user-type-card h6 {
	    margin-bottom: .5rem;
	    font-weight: 700;
	    color: var(--wood-800);
	}
	
	.user-type-card p {
	    margin-bottom: 0;
	    font-size: .9rem;
	    color: var(--text-soft);
}
</style>

<div class="container-fluid">
<div class="row">
    <!-- Sidebar -->
    <%@ include file="includes/sidebar.jsp" %>

    <!-- Main content -->
	<main class="col-md-9 ms-sm-auto col-lg-10">
        <div class="page-header">
            <h1 class="h2"><i class="bi bi-person-plus me-2"></i>Add New User</h1>
        </div>

        <!-- Info Card -->
        <!-- <div class="info-card">
            <div class="icon">
                <i class="bi bi-info-circle"></i>
            </div>
            <h5>User Registration</h5>
            <p class="mb-0">Register new library members and staff. Choose the appropriate user type and fill in the required information to create a new account.</p>
        </div> -->

        <!-- User Type Selection -->
        <div class="form-container">
            <form id="userForm" action="UserController" method="post">
            	<input type="hidden" name="action" value="addUser">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name">
                            <label for="firstName"><i class="bi bi-person me-2"></i>First Name</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last Name">
                            <label for="lastName"><i class="bi bi-person me-2"></i>Last Name</label>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="email" class="form-control" id="email" name="email" placeholder="Email">
                            <label for="email"><i class="bi bi-envelope me-2"></i>Email Address</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="tel" class="form-control" id="phone" name="phone" placeholder="Phone">
                            <label for="phone"><i class="bi bi-telephone me-2"></i>Phone Number</label>
                        </div>
                    </div>
                </div>

                <div class="form-floating">
                    <textarea class="form-control" id="address" name="address" placeholder="Address"></textarea>
                    <label for="address"><i class="bi bi-geo-alt me-2"></i>Address</label>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn-modern">
                        <i class="bi bi-person-plus"></i>Create User
                    </button>
                </div>
            </form>
        </div>
    </main>

</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
