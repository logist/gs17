Class gs17.Build {


XData BuildManifest
{
<Manifest>
<!-- You have to specify JOBNAME with job name via parameter string -->
<If Condition="&quot;${JOBNAME}&quot;=&quot;&quot;"><Error /></If>
<!-- You have to specify SRCDIR with source code directory via parameter string -->
<If Condition="&quot;${SRCDIR}&quot;=&quot;&quot;"><Error /></If>

<!-- Namespace -->
<Var Name="NAMESPACE" Value="${JOBNAME}" />

<!-- Delete old namespace and create new one -->
<Namespace Name="${NAMESPACE}" Create="overwrite" 
  Code="${NAMESPACE}-APP" Data="${NAMESPACE}-DATA">
<Configuration>
<Database Name="${NAMESPACE}-APP" Dir="${DBDIR}/app" Create="overwrite" InitialSize="1" ExpansionSize="1" />
<Database Name="${NAMESPACE}-DATA" Dir="${DBDIR}/data" Create="overwrite" InitialSize="1" ExpansionSize="1" />
 <CSPApplication name="${NAMESPACE}" Directory="${DBDIR}\csp" Url="/csp/${NAMESPACE}"
  Description="Build application" 
  Recurse="true" 
  ServeFiles="true"
   AuthenticationMethods="64" />
</Configuration>


<!-- Invoke compile method -->
<Invoke Class="%SYSTEM.OBJ" Method="ImportDir" CheckStatus="true">
<Arg name="dir" Value="${SRCDIR}" />
<Arg name="wildcards" Value="*.cls" />
<Arg name="qspec" Value="cn" />
<Arg name="errorlog" Value="" />
<Arg name="recursive" Value="1" />
</Invoke>

</Namespace>

</Manifest>
}

/// This method is called to pass parameters into generated build method
ClassMethod Build(pJobName As %String = "BUILD", pSrcDir As %String = "C:\source\", pDbDir) As %Status
{
	set vars("JOBNAME")=$g(pJobName)
	set vars("SRCDIR")=##class(%File).NormalizeDirectory($g(pSrcDir))
	set vars("DBDIR")=$g(pDbDir,vars("SRCDIR")_"db")

	Set pLogLevel=3
	Set sc=..RunBuildManifest(.vars, .pLogLevel)

	Quit sc
}

/// This is a standard %Installer method generator whose code is generated by XGL.
ClassMethod RunBuildManifest(ByRef pVars, pLogLevel As %Integer, pInstaller As %Installer.Installer) As %Status [ CodeMode = objectgenerator, Internal ]
{
	#; Let our XGL document generate code for this method.
	quit ##class(%Installer.Manifest).%Generate(%compiledclass, %code, "BuildManifest")
}



}