<%inherit file="../layouts/base.mako"/>

<%def name="body()">
    <a name="heroes"><h1>Heroes</h1></a>';
    <div class="section">
    % if mode != '':
        % for hero in heroes:
            <ul class="item">
                <li>
                    <a href="../hero.php?id=${hero.id}">
                        <img width="100" src="${hero.image_name}" />
                        % if names == 't':
                            echo hero.common_name
                        % endif
                    </a>
                    <em>
                        <h3>${hero.name}</h3>
                        <p><b>Stat: </b>${hero.stat}<br />
                        <b>Role: </b>${hero.roles}<br />
                        <b>Faction: </b>${hero.faction}</p>
                        ${hero.content}
                    </em>
                </li>
            </ul>
        % endfor
        
        % if len(heroes) == 0:
            <p style="color: #B3432A">No results found.</p>
            </div><br style="clear: both;" />
        % endif
    % else:
        <div class="section"><h3>Strength</h3>
        % for hero in strength_heroes:
            <ul class="item">
                <li>
                    <a href="../hero.php?id=${hero.id}">
                        <img width="100" src="${hero.image_name}" />';
                        % if names == 't':
                           <br /><span style="font-size: 12px; color: #978370;">${hero.common_name}</span>
                        % endif
                    </a>
                    <em>
                        <h3>${hero.name}</h3>
                        <p><b>Stat: </b>${hero.stat}<br />
                        <b>Role: </b>${hero.roles}<br />
                        <b>Faction: </b>${hero.faction}</p>
                        ${hero.content}
                    </em>
                </li>
            </ul>
        % endfor
        
        </div><br />
        <div class="section"><h3>Agility</h3>
        % for hero in agility_heroes:
            <ul class="item">
                <li><a href="../hero.php?id=${hero.id}">
                    <img width="100" src="${hero.image_name}" />';
                    % if names == 't':
                        <br /><span style="font-size: 12px; color: #978370;">${hero.common_name}</span>
                    % endif
                    </a>
                    <em>
                        <h3>${hero.name}</h3>
                        <p><b>Stat: </b>${hero.stat}<br />
                        <b>Role: </b>${hero.roles}<br />
                        <b>Faction: </b>${hero.faction}</p>
                        ${hero.content}
                    </em>
                </li>
            </ul>
        % endfor

        </div><br />
        <div class="section"><h3>Intelligence</h3>
        % for hero in intel_heroes:
            <ul class="item">
                <li>
                    <a href="../hero.php?id=${hero.id}">
                        <img width="100" src="${hero.image_name}" />';
                        % if names == 't':
                            <br /><span style="font-size: 12px; color: #978370;">${hero.common_name}</span>
                        % endif
                    </a>
                    <em>
                        <h3>${hero.name}</h3>
                        <p><b>Stat: </b>${hero.stat}<br />
                        <b>Role: </b>${hero.roles}<br />
                        <b>Faction: </b>${hero.faction}</p>
                        ${hero.content}
                    </em>
                </li>
            </ul>
        % endfor
        </div><br />
    % endif
</%def>