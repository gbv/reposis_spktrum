<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:i18n="xalan://org.mycore.services.i18n.MCRTranslation"
    xmlns:mcrver="xalan://org.mycore.common.MCRCoreVersion"
    xmlns:mcrxsl="xalan://org.mycore.common.xml.MCRXMLFunctions"
    exclude-result-prefixes="i18n mcrver mcrxsl">

  <xsl:import href="resource:xsl/layout/mir-common-layout.xsl" />

  <xsl:template name="mir.navigation">
    <div class="mir-top-nav">
      <div class="container">
        <div class="row">
          <div class="col">
            <div id="options_nav_box" class="mir-prop-nav">
              <nav>
                <ul class="navbar-nav ml-auto flex-row justify-content-end">
                  <xsl:call-template name="mir.loginMenu" />
                  <xsl:call-template name="mir.languageMenu" />
                </ul>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="mir-logo-nav">
      <div class="container">
        <div class="row align-items-center">
          <div class="col">
            <div class="project-logo">
              <a href="{concat($WebApplicationBaseURL,substring($loaded_navigation_xml/@hrefStartingPage,2),$HttpSession)}"
                 class="project-logo__link">
                <div class="project-logo__text">
                  <div class="project-logo__eagle">
                    <img
                      src="{$WebApplicationBaseURL}images/logo-eagle.png"
                      alt="logo spk" />
                  </div>
                  <div class="project-logo__title">
                    <img
                      src="{$WebApplicationBaseURL}images/logo-spktrum-hellblau-2.png"
                      class="img-fluid"
                      alt="logo spktrum" />
                  </div>
                </div>
                <h1 class="project-logo__slogan">Das OpenScience Repositorium der Stiftung Preußischer Kulturbesitz</h1>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="mir-main-nav">
      <div class="container">
        <div class="row">
          <div class="col">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
              <button
                class="navbar-toggler"
                type="button"
                data-toggle="collapse"
                data-target="#mir-main-nav__entries"
                aria-controls="mir-main-nav__entries"
                aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div id="mir-main-nav__entries" class="collapse navbar-collapse mir-main-nav__entries">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                  <xsl:call-template name="project.generate_single_menu_entry">
                    <xsl:with-param name="menuID" select="'brand'"/>
                  </xsl:call-template>
                  <xsl:apply-templates select="$loaded_navigation_xml/menu[@id='search']" />
                  <xsl:apply-templates select="$loaded_navigation_xml/menu[@id='publish']" />
                  <xsl:call-template name="mir.basketMenu" />
                </ul>
              </div>
            </nav>
          </div>
        </div>
      </div>
    </div>
    <div class="project-search-bar">
      <div class="container">
        <div class="row">
          <div class="col">
            <div class="searchBox">
              <xsl:variable name="core">
                <xsl:text>/find</xsl:text>
              </xsl:variable>
              <form
                action="{$WebApplicationBaseURL}servlets/solr{$core}"
                class="searchfield_box form-inline my-2 my-lg-0"
                role="search">
                <div class="input-group">
                  <input
                    name="condQuery"
                    placeholder="{i18n:translate('mir.navsearch.placeholder')}"
                    class="form-control search-query"
                    id="searchInput"
                    type="text"
                    aria-label="Search" />
                  <xsl:if test="mcrxsl:isCurrentUserInRole('admin') or mcrxsl:isCurrentUserInRole('editor')">
                    <input name="owner" type="hidden" value="createdby:*" />
                  </xsl:if>
                  <div class="input-group-append">
                    <button type="submit" class="btn btn-primary my-2 my-sm-0">
                      <i class="fas fa-search"></i>
                    </button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="mir.jumbotwo">
    <!-- ignore -->
  </xsl:template>

  <xsl:template name="mir.footer">
    <div class="footer__project">
      <div class="container">
        <div class="row">
          <div class="col">
            <a href="https://www.preussischer-kulturbesitz.de/index.html" class="sbb-logo" title="SPK Home" target="_blank">
              <img class="sbb_logo img-fluid" src="{$WebApplicationBaseURL}/images/logo-spk-white-free.png" />
            </a>
          </div>
          <div class="col-12 col-lg">
            <div class="footer-menu">
              <div class="footer-menu__column">
                <xsl:call-template name="project.generate_footer_menu_link">
                  <xsl:with-param name="menuLink" select="'/content/below/contact.xed'"/>
                </xsl:call-template>
                <xsl:call-template name="project.generate_footer_menu_link">
                  <xsl:with-param name="menuLink" select="'/content/below/imprint.xml'"/>
                </xsl:call-template>
              </div>
              <div class="footer-menu__column">
                <xsl:call-template name="project.generate_footer_menu_link">
                  <xsl:with-param name="menuLink" select="'/content/below/rights.xml'"/>
                </xsl:call-template>
                <xsl:call-template name="project.generate_footer_menu_link">
                  <xsl:with-param name="menuLink" select="'/content/below/terms_of_use.xml'"/>
                </xsl:call-template>
              </div>
              <div class="footer-menu__column">
                <xsl:call-template name="project.generate_footer_menu_link">
                  <xsl:with-param name="menuLink" select="'/content/below/disclaimer.xml'"/>
                </xsl:call-template>
                <xsl:call-template name="project.generate_footer_menu_link">
                  <xsl:with-param name="menuLink" select="'/content/below/accessibility.xml'"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="mir.powered_by">
    <xsl:variable name="mcr_version" select="concat('MyCoRe ',mcrver:getCompleteVersion())" />
    <div id="powered_by" class="footer__credits">
      <div class="container">
        <div class="row">
          <div class="col-12 col-md-6 credits-spk">
            <span>© 2023 Stiftung Preußischer Kulturbesitz</span>
          </div>
          <div class="col-12 col-md-6 credits-mycore">
            <a href="http://www.mycore.de">
              <img src="{$WebApplicationBaseURL}mir-layout/images/mycore_logo_small_invert.png" title="{$mcr_version}" alt="powered by MyCoRe" />
            </a>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template name="project.generate_single_menu_entry">
    <xsl:param name="menuID" />
    <li class="nav-item">
      <xsl:variable name="menuItem" select="$loaded_navigation_xml/menu[@id=$menuID]/item" />
      <xsl:variable name="activeClass">
        <xsl:choose>
          <xsl:when test="$menuItem/@href = $browserAddress">
            <xsl:text>active</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:text>not-active</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="fullUrl">
        <xsl:call-template name="resolveFullUrl">
          <xsl:with-param name="link" select="$menuItem/@href" />
        </xsl:call-template>
      </xsl:variable>
      <a id="{$menuID}" href="{$fullUrl}" class="nav-link {$activeClass}">
        <xsl:apply-templates select="$menuItem" mode="linkText" />
      </a>
    </li>
  </xsl:template>

  <xsl:template name="project.generate_footer_menu_link">
    <xsl:param name="menuLink" />
    <xsl:variable name="menuItem" select="$loaded_navigation_xml/menu[@id='below']/item[@href=$menuLink]" />
    <xsl:variable name="fullUrl">
      <xsl:call-template name="resolveFullUrl">
        <xsl:with-param name="link" select="$menuItem/@href" />
      </xsl:call-template>
    </xsl:variable>
    <a href="{$fullUrl}" >
      <xsl:apply-templates select="$menuItem" mode="linkText" />
    </a>
  </xsl:template>

  <xsl:template name="resolveFullUrl">
    <xsl:param name="link" />
    <xsl:param name="appBaseUrl" select="$WebApplicationBaseURL" />
    <xsl:choose>
      <xsl:when test="starts-with($link,'http:')
                      or starts-with($link,'https:')
                      or starts-with($link,'mailto:')
                      or starts-with($link,'ftp:')">
        <xsl:value-of select="$link"/>
      </xsl:when>
      <xsl:when test="starts-with($link,'/')">
        <xsl:choose>
          <xsl:when test="substring($appBaseUrl, string-length($appBaseUrl), 1) = '/'">
            <xsl:value-of select="concat(substring($appBaseUrl, 1, string-length($appBaseUrl) - 1), $link)"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="concat($appBaseUrl, $link)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="substring($appBaseUrl, string-length($appBaseUrl), 1) = '/'">
            <xsl:value-of select="concat($appBaseUrl, $link)"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="concat($appBaseUrl, '/', $link)"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
