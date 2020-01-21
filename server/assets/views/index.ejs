<!DOCTYPE html>
<html>

<% include partials/head.ejs %>


<body>
    <script>
        gtag('event', 'screen_view', {
            'screen_name': 'devices',
            'app_name': 'L3MON'
        });

        gtag('event', 'devicecount', {
            'devicesonline': <%= clientsOnline.length %>,
            'devicesoffline': <%= clientsOffline.length %>,
        });

    </script>
    <div class="ui container">
        <% include partials/header.ejs %>
        <div class="ui segment">

            <h3 class="ui grey dividing header">Online</h3>

            <table class="ui celled table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Country</th>
                        <th>IP</th>
                        <th>Device</th>
                        <th>Last Seen</th>
                        <th>Manage</th>
                    </tr>
                </thead>
                <tbody>
                    <% clientsOnline.forEach((item) => { 
                       let lsdate = new Date(item.lastSeen);
                       let flagCss = (item.dynamicData.clientGeo.country !== undefined) ? ('flag ' + item.dynamicData.clientGeo.country).toLowerCase() : 'icon question mark' 
                       let deviceStr = '';
                       deviceStr += (item.dynamicData.device.manufacture !== undefined) ? item.dynamicData.device.manufacture :  ''; 
                       deviceStr += (item.dynamicData.device.model !== undefined) ? ' (' + item.dynamicData.device.model + ')' :  ''; 
                       %>
                    <tr>
                        <td class="collapsing"><%= item.clientID %></td>
                        <td class="collapsing"><i class="<%= flagCss %>"></i></td>
                        <td class="collapsing"><%= item.dynamicData.clientIP %></td>
                        <td><%= deviceStr %></td>
                        <td class="collapsing"><%= lsdate.toLocaleString('en-GB', { timeZone: 'UTC' }) %></td>
                        <td class="collapsing"><a href="/manage/<%= item.clientID %>/info"
                                class="ui button blue">Manage</a>
                        </td>
                    </tr>
                    <% }) %>
                </tbody>
            </table>


            <h3 class="ui grey dividing header">Offline</h3>
            <table class="ui celled table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Country</th>
                        <th>IP</th>
                        <th>Device</th>
                        <th>Last Seen</th>
                        <th>Manage</th>
                    </tr>
                </thead>
                <tbody>
                    <% clientsOffline.forEach((item) => { 
                       let lsdate = new Date(item.lastSeen);
                       let flagCss = (item.dynamicData.clientGeo.country !== undefined) ? ('flag ' + item.dynamicData.clientGeo.country).toLowerCase() : 'icon question mark' 
                       let deviceStr = '';
                       deviceStr += (item.dynamicData.device.manufacture !== undefined) ? item.dynamicData.device.manufacture :  ''; 
                       deviceStr += (item.dynamicData.device.model !== undefined) ? ' (' + item.dynamicData.device.model + ')' :  ''; 
                       %>
                    <tr>
                        <td class="collapsing"><%= item.clientID %></td>
                        <td class="collapsing"><i class="<%= flagCss %>"></i></td>
                        <td class="collapsing"><%= item.dynamicData.clientIP %></td>
                        <td><%= deviceStr %></td>
                        <td class="collapsing"><%= lsdate.toLocaleString('en-GB', { timeZone: 'UTC' }) %></td>
                        <td class="collapsing"><a href="/manage/<%= item.clientID %>/info"
                                class="ui button blue">Manage</a>
                        </td>
                    </tr>
                    <% }) %>
                </tbody>
            </table>
        </div>
    </div>
    <% include partials/footer.ejs %>
</body>

</html>