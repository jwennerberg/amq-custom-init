#!/bin/bash

echo "#### The config dir locates at ${CONFIG_INSTANCE_DIR} ####"
ls ${CONFIG_INSTANCE_DIR}

securitySettingPlugin=""
securitySettingPlugin="${securitySettingPlugin}       <security-setting-plugin class-name='org.apache.activemq.artemis.core.server.impl.LegacyLDAPSecuritySettingPlugin'>\n"
securitySettingPlugin="${securitySettingPlugin}         <setting name='initialContextFactory' value='com.sun.jndi.ldap.LdapCtxFactory'/>\n"
securitySettingPlugin="${securitySettingPlugin}         <setting name='connectionURL' value='${LDAP_CONNECTION_URL}'/>\n"
securitySettingPlugin="${securitySettingPlugin}         <setting name='connectionUsername' value='${LDAP_CONNECTION_USERNAME}'/>\n"
securitySettingPlugin="${securitySettingPlugin}         <setting name='connectionPassword' value='${LDAP_CONNECTION_PASSWORD}'/>\n"
securitySettingPlugin="${securitySettingPlugin}         <setting name='connectionProtocol' value='ssl'/>\n"
securitySettingPlugin="${securitySettingPlugin}         <setting name='authentication' value='simple'/>\n"
securitySettingPlugin="${securitySettingPlugin}         <setting name='destinationBase' value='${LDAP_DESTINATION_BASE}'/>\n"
securitySettingPlugin="${securitySettingPlugin}         <setting name='roleAttribute' value='member'/>\n"
securitySettingPlugin="${securitySettingPlugin}         <setting name='ignorePartialResultException' value='true'/>\n"
securitySettingPlugin="${securitySettingPlugin}         <setting name='filter' value='(cn=*)'/>\n"
securitySettingPlugin="${securitySettingPlugin}         <setting name='mapAdminToManage' value='true' />\n"
securitySettingPlugin="${securitySettingPlugin}         <setting name='adminPermissionValue' value='${LDAP_ADMIN_PERMISSION_VALUE}'/>\n"
securitySettingPlugin="${securitySettingPlugin}         <setting name='readPermissionValue' value='${LDAP_READ_PERMISSION_VALUE}'/>\n"
securitySettingPlugin="${securitySettingPlugin}         <setting name='writePermissionValue' value='${LDAP_WRITE_PERMISSION_VALUE}'/>\n"
securitySettingPlugin="${securitySettingPlugin}       </security-setting-plugin>\n\n"

sed -i "s|<security-settings>|<security-settings>\n ${securitySettingPlugin}|g" ${CONFIG_INSTANCE_DIR}/etc/broker.xml
