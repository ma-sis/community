
      <div class="navbar navbar-expand-lg bg-dark navbar-dark sticky-top">

        <a class="navbar-brand" href="index.jsp">
          <img alt="Pipeline" src="${pageContext.request.contextPath}/resources/assets/img/logo.svg" />
        </a>
        <div class="d-flex align-items-center">
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse" aria-controls="navbar-collapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="d-block d-lg-none ml-2">
            <div class="dropdown">
              <a href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img alt="Image" src="${pageContext.request.contextPath}/resources/assets/img/avatar-male-4.jpg" class="avatar" />
              </a>
              <div class="dropdown-menu dropdown-menu-right">
                <a href="nav-side-user.jsp" class="dropdown-item">Profile</a>
                <a href="utility-account-settings.jsp" class="dropdown-item">Account Settings</a>
                <a href="#" class="dropdown-item">Log Out</a>
              </div>
            </div>
          </div>
        </div>
        <div class="collapse navbar-collapse flex-column" id="navbar-collapse">
          <ul class="navbar-nav d-lg-block">

            <li class="nav-item">

              <a class="nav-link" href="index.jsp">Overview</a>

            </li>

            <li class="nav-item">

              <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-2" aria-controls="submenu-2">Pages</a>
              <div id="submenu-2" class="collapse">
                <ul class="nav nav-small flex-column">

                  <li class="nav-item">
                    <a class="nav-link" href="#" >App Pages</a>
                  </li>

                  <li class="nav-item">
                    <a class="nav-link" href="#" >Utility Pages</a>
                  </li>

                  <li class="nav-item">
                    <a class="nav-link" href="#" >Layouts</a>
                  </li>

                </ul>
              </div>

            </li>

            <li class="nav-item">

              <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-3" aria-controls="submenu-3">Components</a>
              <div id="submenu-3" class="collapse">
                <ul class="nav nav-small flex-column">

                  <li class="nav-item">
                    <a class="nav-link" href="#" >Bootstrap</a>
                  </li>

                  <li class="nav-item">
                    <a class="nav-link" href="#" >Pipeline</a>
                  </li>

                </ul>
              </div>

            </li>

            <li class="nav-item">

              <a class="nav-link" href="#" >Documentation</a>

            </li>

            <li class="nav-item">

              <a class="nav-link" href="#" >Changelog</a>

            </li>

          </ul>
          <hr>
          <div class="d-none d-lg-block w-100">
            <span class="text-small text-muted">Quick Links</span>
            <ul class="nav nav-small flex-column mt-2">
              <li class="nav-item">
                <a href="#" class="nav-link">Team Overview</a>
              </li>
              <li class="nav-item">
                <a href="#"  class="nav-link">Project</a>
              </li>
              <li class="nav-item">
                <a href="#"  class="nav-link">Single Task</a>
              </li>
              <li class="nav-item">
                <a href="#"  class="nav-link">Kanban Board</a>
              </li>
            </ul>
            <hr>
          </div>
          <div>
            <form>
              <div class="input-group input-group-dark input-group-round">
                <div class="input-group-prepend">
                  <span class="input-group-text">
                    <i class="material-icons">search</i>
                  </span>
                </div>
                <input type="search" class="form-control form-control-dark" placeholder="Search" aria-label="Search app">
              </div>
            </form>
            <div class="dropdown mt-2">
              <button class="btn btn-primary btn-block dropdown-toggle" type="button" id="newContentButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Add New
              </button>
              <div class="dropdown-menu">
                <a class="dropdown-item" href="#">Team</a>
                <a class="dropdown-item" href="#">Project</a>
                <a class="dropdown-item" href="#">Task</a>
              </div>
            </div>
          </div>
        </div>
        <div class="d-none d-lg-block">
          <div class="dropup">
            <a href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <img alt="Image" src="${pageContext.request.contextPath}/resources/assets/img/avatar-male-4.jpg" class="avatar" />
            </a>
            <div class="dropdown-menu">
              <a href="#"  class="dropdown-item">Profile</a>
              <a href="#"  class="dropdown-item">Account Settings</a>
              <a href="#" class="dropdown-item">Log Out</a>
            </div>
          </div>
        </div>

      </div>
