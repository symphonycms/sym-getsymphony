<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="footer">
  <footer id="footer">
    <div class="field">
      <!-- Community -->
      <p class="footer-community">
        <strong>&#169; 2010–<xsl:value-of select="$this-year" /> The Symphony Community</strong>
        <a href="http://getsymphony.com">International Site</a> · <a href="http://twitter.com/symphonycms">Twitter</a>
      </p>
      <!-- Developer links -->
      <p class="footer-links">
        <strong>Plan, Play and Practice</strong>
        <a href="https://github.com/symphonycms/symphony-2/blob/master/README.markdown">Requirements</a> · <a href="https://github.com/symphonycms/symphony-2/blob/master/LICENCE">MIT Licence</a> · <a href="http://github.com/symphonycms">Github</a>
      </p>
      <!-- Factory artwork -->
      <p class="footer-factory">
        <em>Conducting sites since 2004</em>
        <a href="http://getsymphony.com">Symphony Community</a>
      </p>
    </div>
  </footer>
</xsl:template>

</xsl:stylesheet>