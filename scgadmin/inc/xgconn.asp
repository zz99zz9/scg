<%
db="/%#Data$%Ba#se%%/%#Data$%Ba#se%%scg.asa"
Set conn = Server.CreateObject("ADODB.Connection")
connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(""&db&"")

conn.open connstr

sub isnumber(pro_id)
if not IsNumeric (pro_id) then
response.Write "参数异常"
response.End
end if
end sub
%>
