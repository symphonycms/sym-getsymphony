<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl" />
<xsl:import href="../utilities/ninja.xsl" />

<xsl:template match="data">
	<xsl:apply-templates select="content/*" mode="ninja" />
</xsl:template>

<xsl:template match="/" mode="body">
  <body>
    <!-- Current page -->
    <div id="site">
      <xsl:call-template name="header" />
      <section class="field">
        <div class="column sidebar infobox">
          <h3>Browse Features</h3>
          <ul>
            <li>
              <a href="http://www.getsymphony.com/explore/sound-principles/">Sound Principles</a>
            </li>
            <li>
              <a href="http://www.getsymphony.com/explore/open-architecture/">Open Architecture</a>
            </li>
            <li>
              <a href="http://www.getsymphony.com/explore/flexible-templating/">Flexible Templating</a>
            </li>
            <li>
              <a href="http://www.getsymphony.com/explore/elegant-interface/">Elegant Interface</a>
            </li>
            <li>
              <a href="http://www.getsymphony.com/explore/vibrant-support-system/">Vibrant Support System</a>
            </li>
          </ul>
        </div>
        <div class="column content">
          <h2>Maintenance</h2>
          <p class="content-introduction">This site is currently undergoing maintenance. Please visit the current <a href="http://getsymphony.com">Symphony community site</a> to find out more about how this project is moving along.</p>

          <h3><a href="http://www.getsymphony.com/explore/">Explore Symphony's Features</a></h3>
          <p>Approaches content management with the underlying goals of <strong>simplicity</strong> and <strong>openness</strong>, so you can build anything.</p>

          <h3><a href="http://www.getsymphony.com/guides/">Guides</a></h3>
          <p>Everything you need to know to start building your first Symphony website.</p>

          <h3><a href="http://www.getsymphony.com/learn/tutorials/">Tutorials</a></h3>
          <p><strong>The Road to Mastery.</strong> Our tutorials are like typing <strong>“become a web development ninja”</strong> into Google Maps and clicking “Get Directions”</p>

          <h3><a href="http://www.getsymphony.com/learn/articles/">Articles</a></h3>
          <p><strong>Get your thinking cap on.</strong> And it better be waterproof. These articles will shower you with hot Symphony knowledge.</p>

          <h3><a href="http://www.getsymphony.com/learn/concepts/">Concepts</a></h3>
          <p><strong>A Symphony-pedia.</strong> The ultimate reference for all things Symphony.</p>

          <h3><a href="http://www.getsymphony.com/learn/faq/">FAQ</a></h3>
          <p><strong>Are We There Yet?</strong> Answers to the most frequently asked questions.</p>

          <h3><a href="http://www.getsymphony.com/learn/api/">API</a></h3>
          <p><strong>API Reference.</strong> All classes, functions, <a href="http://www.getsymphony.com/learn/api/2.3.2/deprecated/">deprecated code</a> and <a href="http://www.getsymphony.com/learn/api/2.3.2/delegates/">delegates</a> in Symphony.</p>

        </div>
      </section>
    </div>
    <xsl:call-template name="footer" />
  </body>
</xsl:template>

<xsl:template name="header">
  <header class="site-header centered navigation-none">
    <h1>
      <span>Symphony</span>
        <xsl:text> </xsl:text>
        Development
    </h1>
  </header>
</xsl:template>

</xsl:stylesheet>