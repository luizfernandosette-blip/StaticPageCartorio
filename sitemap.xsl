<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:sm="http://www.sitemaps.org/schemas/sitemap/0.9"
  xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
  exclude-result-prefixes="sm image">

  <xsl:output method="html" encoding="UTF-8" indent="yes" />

  <xsl:template match="/">
    <html lang="pt-BR">
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <meta name="robots" content="noindex, follow" />
      <title>Sitemap – Cartório RTDPJ Sabará</title>
      <style>
        *  { margin:0; padding:0; box-sizing:border-box; }
        body { font-family:'Segoe UI',Arial,sans-serif; background:#F6F8FC; color:#2A3548; }
        header { background:#0B1E3D; padding:28px 40px; display:flex; align-items:center; gap:16px; }
        header .icon { background:#C9A84C; width:46px; height:46px; border-radius:10px; display:flex; align-items:center; justify-content:center; font-size:1.3rem; }
        header h1 { color:#fff; font-size:1.3rem; font-weight:700; }
        header p  { color:rgba(255,255,255,.55); font-size:.8rem; }
        .container { max-width:960px; margin:0 auto; padding:40px 28px; }
        .meta { background:#fff; border-radius:12px; padding:20px 28px; margin-bottom:32px; border:1px solid #DDE3EF; display:flex; gap:40px; }
        .meta span { font-size:.82rem; color:#556070; }
        .meta strong { display:block; font-size:1.25rem; color:#0B1E3D; font-weight:700; }
        table { width:100%; border-collapse:collapse; background:#fff; border-radius:12px; overflow:hidden; box-shadow:0 4px 20px rgba(10,30,70,.08); }
        thead th { background:#0B1E3D; color:#fff; font-size:.75rem; font-weight:700; text-transform:uppercase; letter-spacing:1px; padding:14px 20px; text-align:left; }
        tbody tr { border-bottom:1px solid #EEF2F8; transition:background .2s; }
        tbody tr:last-child { border:none; }
        tbody tr:hover { background:#F6F8FC; }
        td { padding:14px 20px; font-size:.86rem; vertical-align:middle; }
        td a { color:#1A3A6B; font-weight:600; word-break:break-all; }
        td a:hover { color:#C9A84C; text-decoration:underline; }
        .badge { display:inline-block; padding:3px 10px; border-radius:50px; font-size:.7rem; font-weight:700; }
        .p-high   { background:rgba(26,58,107,.1);  color:#1A3A6B; }
        .p-medium { background:rgba(201,168,76,.12); color:#9E7A30; }
        .p-low    { background:rgba(100,120,140,.1); color:#556070; }
        footer { text-align:center; padding:28px; font-size:.75rem; color:#8493A8; }
      </style>
    </head>
    <body>
      <header>
        <div class="icon">&#9962;</div>
        <div>
          <h1>Sitemap – Cartório RTDPJ Sabará</h1>
          <p>Mapa de páginas para indexação pelos mecanismos de busca</p>
        </div>
      </header>

      <div class="container">
        <div class="meta">
          <div>
            <strong><xsl:value-of select="count(sm:urlset/sm:url)" /></strong>
            <span>URLs indexadas</span>
          </div>
          <div>
            <strong>pt-BR</strong>
            <span>Idioma</span>
          </div>
          <div>
            <strong>Sabará, MG</strong>
            <span>Região alvo</span>
          </div>
        </div>

        <table>
          <thead>
            <tr>
              <th>#</th>
              <th>URL</th>
              <th>Última atualização</th>
              <th>Frequência</th>
              <th>Prioridade</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="sm:urlset/sm:url">
              <xsl:variable name="prio" select="sm:priority" />
              <tr>
                <td><xsl:value-of select="position()" /></td>
                <td><a href="{sm:loc}"><xsl:value-of select="sm:loc" /></a></td>
                <td><xsl:value-of select="sm:lastmod" /></td>
                <td><xsl:value-of select="sm:changefreq" /></td>
                <td>
                  <xsl:choose>
                    <xsl:when test="number($prio) >= 0.9">
                      <span class="badge p-high"><xsl:value-of select="$prio" /></span>
                    </xsl:when>
                    <xsl:when test="number($prio) >= 0.7">
                      <span class="badge p-medium"><xsl:value-of select="$prio" /></span>
                    </xsl:when>
                    <xsl:otherwise>
                      <span class="badge p-low"><xsl:value-of select="$prio" /></span>
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </div>
      <footer>Cartório de Registro de Títulos e Documentos e Civil das Pessoas Jurídicas de Sabará – MG · CNPJ 23.334.303/0001-46</footer>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
