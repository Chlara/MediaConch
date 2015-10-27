<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:mc="https://mediaarea.net/mediaconch" xmlns:ma="https://mediaarea.net/mediaarea" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0" extension-element-prefixes="xsi ma">
  <xsl:output encoding="UTF-8" method="xml" version="1.0" indent="yes"/>
  <xsl:template match="ma:MediaArea">
    <MediaConch>
      <xsl:attribute name="version">
        <xsl:text>0.1</xsl:text>
      </xsl:attribute>
      <policyChecks>
        <title>MKV/FFV1 (reformatted QT/v210) </title>
        <description>Policy check for Matroska-wrapped FFV1 and LPCM file, transcoded from QuickTime-wrapped v210 and LPCM file. </description>
        <xsl:for-each select="ma:media">
          <media>
            <xsl:attribute name="ref">
              <xsl:value-of select="./@ref"/>
            </xsl:attribute>
            <policy>
              <xsl:attribute name="title">General Format equals Matroska</xsl:attribute>
              <context>
                <xsl:attribute name="field">Format</xsl:attribute>
                <xsl:attribute name="value">Matroska</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='General'][1]/ma:Format">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='General'][1]/ma:Format">
                    <xsl:call-template name="is_equal">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">Matroska</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">General Format_Version is Version 4</xsl:attribute>
              <context>
                <xsl:attribute name="field">Format_Version</xsl:attribute>
                <xsl:attribute name="value">4</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='General'][1]/ma:Format_Version">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='General'][1]/ma:Format_Version">
                    <xsl:call-template name="is_equal">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">4</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">General Duration is greater or equal than 1 KiB</xsl:attribute>
              <context>
                <xsl:attribute name="field">FileSize</xsl:attribute>
                <xsl:attribute name="value">1</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='General'][1]/ma:FileSize">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='General'][1]/ma:FileSize">
                    <xsl:call-template name="is_greater_or_equal_than">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">1</xsl:with-param>
                      <xsl:with-param name="field">FileSize</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">General Duration is greater or equal than 1 ms</xsl:attribute>
              <context>
                <xsl:attribute name="field">Duration</xsl:attribute>
                <xsl:attribute name="value">1</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='General'][1]/ma:Duration">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='General'][1]/ma:Duration">
                    <xsl:call-template name="is_greater_or_equal_than">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">1</xsl:with-param>
                      <xsl:with-param name="field">Duration</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">Video Format is FFV1</xsl:attribute>
              <context>
                <xsl:attribute name="field">Format</xsl:attribute>
                <xsl:attribute name="value">FFV1</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='Video'][1]/ma:Format">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='Video'][1]/ma:Format">
                    <xsl:call-template name="is_equal">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">FFV1</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">Video Format_Version is greater or equal than 1</xsl:attribute>
              <context>
                <xsl:attribute name="field">Format_Version</xsl:attribute>
                <xsl:attribute name="value">1</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='Video'][1]/ma:Format_Version">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='Video'][1]/ma:Format_Version">
                    <xsl:call-template name="is_greater_or_equal_than">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">1</xsl:with-param>
                      <xsl:with-param name="field">Format_Version</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">Video CodecID is equal to FFV1</xsl:attribute>
              <context>
                <xsl:attribute name="field">CodecID</xsl:attribute>
                <xsl:attribute name="value">V_MS/VFW/FOURCC / FFV1</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='Video'][1]/ma:CodecID">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='Video'][1]/ma:CodecID">
                    <xsl:call-template name="is_equal">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">V_MS/VFW/FOURCC / FFV1</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">Video Duration is greater or equal than 1 ms</xsl:attribute>
              <context>
                <xsl:attribute name="field">Duration</xsl:attribute>
                <xsl:attribute name="value">1</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='Video'][1]/ma:Duration">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='Video'][1]/ma:Duration">
                    <xsl:call-template name="is_greater_or_equal_than">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">1</xsl:with-param>
                      <xsl:with-param name="field">Duration</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">Video Width is equal to 720 (pixels)</xsl:attribute>
              <context>
                <xsl:attribute name="field">Width</xsl:attribute>
                <xsl:attribute name="value">720</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='Video'][1]/ma:Width">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='Video'][1]/ma:Width">
                    <xsl:call-template name="is_equal">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">720</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">Video Height is equal to 486 (pixels)</xsl:attribute>
              <context>
                <xsl:attribute name="field">Height</xsl:attribute>
                <xsl:attribute name="value">486</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='Video'][1]/ma:Height">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='Video'][1]/ma:Height">
                    <xsl:call-template name="is_equal">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">486</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">Video DisplayAspectRatio is 4:3 (1.333)</xsl:attribute>
              <context>
                <xsl:attribute name="field">DisplayAspectRatio</xsl:attribute>
                <xsl:attribute name="value">1.333</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='Video'][1]/ma:DisplayAspectRatio">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='Video'][1]/ma:DisplayAspectRatio">
                    <xsl:call-template name="is_equal">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">1.333</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">Video FrameRate_Mode is Constant (CFR)</xsl:attribute>
              <context>
                <xsl:attribute name="field">FrameRate_Mode</xsl:attribute>
                <xsl:attribute name="value">CFR</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='Video'][1]/ma:FrameRate_Mode">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='Video'][1]/ma:FrameRate_Mode">
                    <xsl:call-template name="is_equal">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">CFR</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">Video FrameRate equals 29.97 (fps)</xsl:attribute>
              <context>
                <xsl:attribute name="field">FrameRate</xsl:attribute>
                <xsl:attribute name="value">29.970</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='Video'][1]/ma:FrameRate">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='Video'][1]/ma:FrameRate">
                    <xsl:call-template name="is_equal">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">29.970</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">Video Standard is NTSC</xsl:attribute>
              <context>
                <xsl:attribute name="field">Standard</xsl:attribute>
                <xsl:attribute name="value">NTSC</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='Video'][1]/ma:Standard">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='Video'][1]/ma:Standard">
                    <xsl:call-template name="is_equal">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">NTSC</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">Video ColorSpace is YUV</xsl:attribute>
              <context>
                <xsl:attribute name="field">ColorSpace</xsl:attribute>
                <xsl:attribute name="value">YUV</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='Video'][1]/ma:ColorSpace">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='Video'][1]/ma:ColorSpace">
                    <xsl:call-template name="is_equal">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">YUV</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">Video ChromaSubsampling is 4:2:2</xsl:attribute>
              <context>
                <xsl:attribute name="field">ChromaSubsampling</xsl:attribute>
                <xsl:attribute name="value">4:2:2</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='Video'][1]/ma:ChromaSubsampling">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='Video'][1]/ma:ChromaSubsampling">
                    <xsl:call-template name="is_equal">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">4:2:2</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">Video BitDepth equals 10-bit</xsl:attribute>
              <context>
                <xsl:attribute name="field">BitDepth</xsl:attribute>
                <xsl:attribute name="value">10</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='Video'][1]/ma:BitDepth">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='Video'][1]/ma:BitDepth">
                    <xsl:call-template name="is_equal">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">10</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">Video Compression_Mode equals Lossless</xsl:attribute>
              <context>
                <xsl:attribute name="field">Compression_Mode</xsl:attribute>
                <xsl:attribute name="value">Lossless</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='Video'][1]/ma:Compression_Mode">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='Video'][1]/ma:Compression_Mode">
                    <xsl:call-template name="is_equal">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">Lossless</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">Audio Format equals Pulse Code Modulation (PCM)</xsl:attribute>
              <context>
                <xsl:attribute name="field">Format</xsl:attribute>
                <xsl:attribute name="value">PCM</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='Audio'][1]/ma:Format">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='Audio'][1]/ma:Format">
                    <xsl:call-template name="is_equal">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">PCM</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">Audio CodecID is A_PCM/INT/LIT</xsl:attribute>
              <context>
                <xsl:attribute name="field">CodecID</xsl:attribute>
                <xsl:attribute name="value">A_PCM/INT/LIT</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='Audio'][1]/ma:CodecID">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='Audio'][1]/ma:CodecID">
                    <xsl:call-template name="is_equal">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">A_PCM/INT/LIT</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">Audio Duration is greater or equal than 1 ms</xsl:attribute>
              <context>
                <xsl:attribute name="field">Duration</xsl:attribute>
                <xsl:attribute name="value">1</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='Audio'][1]/ma:Duration">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='Audio'][1]/ma:Duration">
                    <xsl:call-template name="is_greater_or_equal_than">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">1</xsl:with-param>
                      <xsl:with-param name="field">Duration</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">Audio BitRate_Mode is Constant (CBR)</xsl:attribute>
              <context>
                <xsl:attribute name="field">BitRate_Mode</xsl:attribute>
                <xsl:attribute name="value">CBR</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='Audio'][1]/ma:BitRate_Mode">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='Audio'][1]/ma:BitRate_Mode">
                    <xsl:call-template name="is_equal">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">CBR</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">Audio Channels equals 4</xsl:attribute>
              <context>
                <xsl:attribute name="field">Channels</xsl:attribute>
                <xsl:attribute name="value">4</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='Audio'][1]/ma:Channels">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='Audio'][1]/ma:Channels">
                    <xsl:call-template name="is_equal">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">4</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">Audio SamplingRate equals 48 (kHz)</xsl:attribute>
              <context>
                <xsl:attribute name="field">SamplingRate</xsl:attribute>
                <xsl:attribute name="value">48000</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='Audio'][1]/ma:SamplingRate">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='Audio'][1]/ma:SamplingRate">
                    <xsl:call-template name="is_equal">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">48000</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
            <policy>
              <xsl:attribute name="title">Audio BitDepth equals 16-bit</xsl:attribute>
              <context>
                <xsl:attribute name="field">BitDepth</xsl:attribute>
                <xsl:attribute name="value">16</xsl:attribute>
              </context>
              <xsl:choose>
                <xsl:when test="ma:MediaInfo/ma:track[@type='Audio'][1]/ma:BitDepth">
                  <xsl:for-each select="ma:MediaInfo/ma:track[@type='Audio'][1]/ma:BitDepth">
                    <xsl:call-template name="is_equal">
                      <xsl:with-param name="xpath" select="."/>
                      <xsl:with-param name="value">16</xsl:with-param>
                    </xsl:call-template>
                  </xsl:for-each>
                </xsl:when>
              </xsl:choose>
            </policy>
          </media>
        </xsl:for-each>
      </policyChecks>
    </MediaConch>
  </xsl:template>
  <xsl:template name="is_true">
    <xsl:param name="xpath"/>
    <xsl:element name="test">
      <xsl:if test="../@type">
        <xsl:attribute name="tracktype">
          <xsl:value-of select="../@type"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="../@streamid">
        <xsl:attribute name="streamid">
          <xsl:value-of select="../@streamid"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="$xpath">
          <xsl:attribute name="outcome">pass</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="outcome">fail</xsl:attribute>
          <xsl:attribute name="reason">is not true</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>
  <xsl:template name="is_equal">
    <xsl:param name="xpath"/>
    <xsl:param name="value"/>
    <xsl:element name="test">
      <xsl:if test="../@type">
        <xsl:attribute name="tracktype">
          <xsl:value-of select="../@type"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="../@streamid">
        <xsl:attribute name="streamid">
          <xsl:value-of select="../@streamid"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="actual">
        <xsl:value-of select="$xpath"/>
      </xsl:attribute>
      <xsl:choose>
        <xsl:when test="$xpath = $value">
          <xsl:attribute name="outcome">pass</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="outcome">fail</xsl:attribute>
          <xsl:attribute name="reason">is not equal</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>
  <xsl:template name="is_not_equal">
    <xsl:param name="xpath"/>
    <xsl:param name="value"/>
    <xsl:element name="test">
      <xsl:if test="../@type">
        <xsl:attribute name="tracktype">
          <xsl:value-of select="../@type"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="../@streamid">
        <xsl:attribute name="streamid">
          <xsl:value-of select="../@streamid"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="expected">
        <xsl:value-of select="$value"/>
      </xsl:attribute>
      <xsl:attribute name="actual">
        <xsl:value-of select="$xpath"/>
      </xsl:attribute>
      <xsl:choose>
        <xsl:when test="$xpath != $value">
          <xsl:attribute name="outcome">pass</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="outcome">fail</xsl:attribute>
          <xsl:attribute name="reason">is equal</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>
  <xsl:template name="is_greater_than">
    <xsl:param name="xpath"/>
    <xsl:param name="value"/>
    <xsl:element name="test">
      <xsl:if test="../@type">
        <xsl:attribute name="tracktype">
          <xsl:value-of select="../@type"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="../@streamid">
        <xsl:attribute name="streamid">
          <xsl:value-of select="../@streamid"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="expected">
        <xsl:value-of select="$value"/>
      </xsl:attribute>
      <xsl:attribute name="actual">
        <xsl:value-of select="$xpath"/>
      </xsl:attribute>
      <xsl:choose>
        <xsl:when test="$xpath &gt; $value">
          <xsl:attribute name="outcome">pass</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="outcome">fail</xsl:attribute>
          <xsl:attribute name="reason">is less than or equal</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>
  <xsl:template name="is_less_than">
    <xsl:param name="xpath"/>
    <xsl:param name="value"/>
    <xsl:element name="test">
      <xsl:if test="../@type">
        <xsl:attribute name="tracktype">
          <xsl:value-of select="../@type"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="../@streamid">
        <xsl:attribute name="streamid">
          <xsl:value-of select="../@streamid"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="expected">
        <xsl:value-of select="$value"/>
      </xsl:attribute>
      <xsl:attribute name="actual">
        <xsl:value-of select="$xpath"/>
      </xsl:attribute>
      <xsl:choose>
        <xsl:when test="$xpath &lt; $value">
          <xsl:attribute name="outcome">pass</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="outcome">fail</xsl:attribute>
          <xsl:attribute name="reason">is greater than or equal</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>
  <xsl:template name="is_greater_or_equal_than">
    <xsl:param name="xpath"/>
    <xsl:param name="value"/>
    <xsl:element name="test">
      <xsl:if test="../@type">
        <xsl:attribute name="tracktype">
          <xsl:value-of select="../@type"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="../@streamid">
        <xsl:attribute name="streamid">
          <xsl:value-of select="../@streamid"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="expected">
        <xsl:value-of select="$value"/>
      </xsl:attribute>
      <xsl:attribute name="actual">
        <xsl:value-of select="$xpath"/>
      </xsl:attribute>
      <xsl:choose>
        <xsl:when test="$xpath &gt;= $value">
          <xsl:attribute name="outcome">pass</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="outcome">fail</xsl:attribute>
          <xsl:attribute name="reason">is less than</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>
  <xsl:template name="is_less_or_equal_than">
    <xsl:param name="xpath"/>
    <xsl:param name="value"/>
    <xsl:element name="test">
      <xsl:if test="../@type">
        <xsl:attribute name="tracktype">
          <xsl:value-of select="../@type"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="../@streamid">
        <xsl:attribute name="streamid">
          <xsl:value-of select="../@streamid"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="expected">
        <xsl:value-of select="$value"/>
      </xsl:attribute>
      <xsl:attribute name="actual">
        <xsl:value-of select="$xpath"/>
      </xsl:attribute>
      <xsl:choose>
        <xsl:when test="$xpath &lt;= $value">
          <xsl:attribute name="outcome">pass</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="outcome">fail</xsl:attribute>
          <xsl:attribute name="reason">is greater than</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>
  <xsl:template name="exists">
    <xsl:param name="xpath"/>
    <xsl:element name="test">
      <xsl:if test="../@type">
        <xsl:attribute name="tracktype">
          <xsl:value-of select="../@type"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="../@streamid">
        <xsl:attribute name="streamid">
          <xsl:value-of select="../@streamid"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="actual">
        <xsl:value-of select="$xpath"/>
      </xsl:attribute>
      <xsl:choose>
        <xsl:when test="string-length($xpath) != 0">
          <xsl:attribute name="outcome">pass</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="outcome">fail</xsl:attribute>
          <xsl:attribute name="reason">does not exist</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>
  <xsl:template name="does_not_exist">
    <xsl:param name="xpath"/>
    <xsl:element name="test">
      <xsl:if test="../@type">
        <xsl:attribute name="tracktype">
          <xsl:value-of select="../@type"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="../@streamid">
        <xsl:attribute name="streamid">
          <xsl:value-of select="../@streamid"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="actual">
        <xsl:value-of select="$xpath"/>
      </xsl:attribute>
      <xsl:choose>
        <xsl:when test="string-length($xpath) = '0'">
          <xsl:attribute name="outcome">pass</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="outcome">fail</xsl:attribute>
          <xsl:attribute name="reason">exists</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>
  <xsl:template name="contains_string">
    <xsl:param name="xpath"/>
    <xsl:param name="value"/>
    <xsl:element name="test">
      <xsl:if test="../@type">
        <xsl:attribute name="tracktype">
          <xsl:value-of select="../@type"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="../@streamid">
        <xsl:attribute name="streamid">
          <xsl:value-of select="../@streamid"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="expected">
        <xsl:value-of select="$value"/>
      </xsl:attribute>
      <xsl:attribute name="actual">
        <xsl:value-of select="$xpath"/>
      </xsl:attribute>
      <xsl:choose>
        <xsl:when test="contains($xpath, $value)">
          <xsl:attribute name="outcome">pass</xsl:attribute>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="outcome">fail</xsl:attribute>
          <xsl:attribute name="reason">does not contain</xsl:attribute>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
