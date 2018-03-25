





{include file='user/main.tpl'}

{$ssr_prefer = URL::SSRCanConnect($user, 0)}


	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">用户中心</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="ui-card-wrap">

						<div class="col-lg-6 col-md-6">

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading"><i class="icon icon-md">notifications_active</i>公告栏</p>
                                        {if $user->class==0}
                                            <p><h4><span class="icon icon-lg">start</span> 尊敬的{$user->user_name}，您还未购买任何套餐或套餐已过期。请先到<a href="/user/code">充值界面</a>充值金额，再到<a href="/user/shop">商店界面</a>购买套餐，否则将无法使用。</p></h4>
										{/if}
									<!--<p>其他公告请到<a href="/user/announcement"/>公告面板</a>查看。</p>-->
										{if $ann != null}
										<p>{$ann->content}</p>
										{/if}
									</div>

								</div>
							</div>

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading"><i class="icon icon-md">phonelink</i> 快速添加节点</p>
										<nav class="tab-nav margin-top-no">
											<ul class="nav nav-list">
												<li {if $ssr_prefer}class="active"{/if}>
													<a class="waves-attach" data-toggle="tab" href="#all_ssr"><i class="icon icon-lg">airplanemode_active</i>&nbsp;ShadowsocksR</a>
												</li>
												<li {if !$ssr_prefer}class="active"{/if}>
													<a class="waves-attach" data-toggle="tab" href="#all_ss"><i class="icon icon-lg">flight_takeoff</i>&nbsp;Shadowsocks</a>
												</li>
											</ul>
										</nav>
										<div class="card-inner">
											<div class="tab-content">
												<div class="tab-pane fade {if $ssr_prefer}active in{/if}" id="all_ssr">
													{$pre_user = URL::cloneUser($user)}

													<nav class="tab-nav margin-top-no">
														<ul class="nav nav-list">
															<li class="active">
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_windows"><i class="icon icon-lg">desktop_windows</i>&nbsp;Windows</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_mac"><i class="icon icon-lg">laptop_mac</i>&nbsp;MacOS</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_linux"><i class="icon icon-lg">dvr</i>&nbsp;Linux</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_ios"><i class="icon icon-lg">phone_iphone</i>&nbsp;iOS</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_android"><i class="icon icon-lg">android</i>&nbsp;Android</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_router"><i class="icon icon-lg">router</i>&nbsp;路由器</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_game"><i class="icon icon-lg">videogame_asset</i>&nbsp;游戏端</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_info"><i class="icon icon-lg">info_outline</i>&nbsp;连接信息</a>
															</li>
														</ul>
													</nav>
													<div class="tab-pane fade active in" id="all_ssr_windows">
														{$user = URL::getSSRConnectInfo($pre_user)}
														{$ssr_url_all = URL::getAllUrl($pre_user, 0, 0)}
														{$ssr_url_all_mu = URL::getAllUrl($pre_user, 1, 0)}
														<p><span class="icon icon-lg text-white">looks_one</span><a href="/ssr-download/ssr-win.7z"> 点击我下载</a></p>
														<p><span class="icon icon-lg text-white">looks_two</span> 解压至任意磁盘</p>
														<p><span class="icon icon-lg text-white">looks_3</span> 运行程序(以下操作全部在任务栏右下角的纸飞机图标右键操作)</p>
														<p> <span class="icon icon-lg text-white">looks_4</span> 服务器订阅<span class="icon icon-lg text-white">play_arrow</span>SSR服务器订阅设置<span class="icon icon-lg text-white">play_arrow</span>Add<span class="icon icon-lg text-white">play_arrow</span>清空网址栏内容，将订阅链接设置为下面的<code><span class="icon icon-lg text-white">flash_auto</span>订阅地址</code>，并点击确定。</p> 
														<p> <span class="icon icon-lg text-white">looks_5</span> 服务器订阅<span class="icon icon-lg text-white">play_arrow</span>更新SSR服务器订阅(不通过代理)，并把“服务器负载均衡”关掉。</p>
														<p> <span class="icon icon-lg text-white">looks_6</span> 然后右键小飞机图标<span class="icon icon-lg text-white">play_arrow</span>服务器<span class="icon icon-lg text-white">play_arrow</span>谜之屋，选择一个合适的服务器，以及PAC<span class="icon icon-lg text-white">play_arrow</span>更新PAC为GFWList，代理规则选“绕过局域网和大陆”，系统代理模式建议选“PAC模式”(PAC模式会根据规则，国内网站不走代理，国外网站走代理；全局模式是所有网站都走代理），即可上网。</p>
														<p><span class="icon icon-lg text-white">flash_auto</span> 订阅地址：<input type="text" class="input form-control form-control-monospace" name="input1" readonly="" value="{$baseUrl}/link/{$ssr_sub_token}?mu=0"><button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$baseUrl}/link/{$ssr_sub_token}?mu=0">点击拷贝订阅地址</button><br>
														<!--	单端口多用户端口订阅地址：<code>{$baseUrl}/link/{$ssr_sub_token}?mu=1</code>  -->
														</p>
														<p><a href="/user/announcement">点击这里查看Windows傻瓜式教程</a></p> 
													</div>
													<div class="tab-pane fade" id="all_ssr_mac">
														<p><span class="icon icon-lg text-white">looks_one</span><a href="/ssr-download/ssr-mac.dmg"> 点击我下载</a></p>
                                                      	<p><span class="icon icon-lg text-white">looks_two</span> 打开下载的Dmg文件</p>
                                                     	<p><span class="icon icon-lg text-white">looks_3</span> 把ShadowsocksX拖入到Finder的应用程序列表(Applications)</p>
                                                      	<p><span class="icon icon-lg text-white">looks_4</span> 打开Launchapad里的ShadowsocksX</p>
                                                      	<p><span class="icon icon-lg text-white">looks_5</span> 菜单栏的小飞机图标<span class="icon icon-lg text-white">play_arrow</span>服务器<span class="icon icon-lg text-white">play_arrow</span>服务器订阅填入以下<code><span class="icon icon-lg text-white">flash_auto</span>订阅地址</code>，更新后出现您的节点</p>
														<p><span class="icon icon-lg text-white">looks_6</span> 菜单栏的小飞机图标<span class="icon icon-lg text-white">play_arrow</span>打开shadowsocks</p>
														<p><span class="icon icon-lg text-white">flash_auto</span> 订阅地址：<input type="text" class="input form-control form-control-monospace" name="input1" readonly="" value="{$baseUrl}/link/{$ssr_sub_token}?mu=0"><button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$baseUrl}/link/{$ssr_sub_token}?mu=0">点击拷贝订阅地址</button><br>
														<!--	单端口多用户端口订阅地址：<code>{$baseUrl}/link/{$ssr_sub_token}?mu=1</code>   -->
														</p>
														<p><a href="/user/announcement">点击这里查看Mac傻瓜式教程</a></p> 
													</div>
													<div class="tab-pane fade" id="all_ssr_linux">
														<p><a href="/Course.html#Linux">点击这里查看Linux傻瓜式教程</a></p> 
													</div>
													<div class="tab-pane fade" id="all_ssr_ios">
                                                        <p><span class="icon icon-lg text-white">looks_one</span> 切换<code>App Store</code>账号-ID:<code>xxxxxxxxx</code> 密码<code>{if $user->class==0}密码仅充值套餐可见{else}xxxxxxxxx{/if}</code>注意特殊符号与大小写,显示按钮buy，3.99$，请直接buy安装（不会扣钱）。（千万不要试图登陆iCloud，会上传您的照片与通讯录到这个账户上）</p>
                                                        <p><span class="icon icon-lg text-white">looks_two</span> 商店搜索<code>Shadowrocket</code>下载安装</p>
                                                      	<p><span class="icon icon-lg text-white">looks_3</span> 安装完成后切换回您自己的账号。（请务必切换回您自己的账户）</p>
												<!--    <p>两种方式导入所有节点</p> 
                                                        <p>1、在 Safari 中点击 <a href="{$ssr_url_all}">这个（普通端口）</a>或者<a href="{$ssr_url_all_mu}">这个（单端口多用户）</a>，然后点击确定，就可以批量添加节点。</p>   -->
														<p><span class="icon icon-lg text-white">looks_4</span> 打开Shadowrocket软件后，点击右上角<span class="icon icon-lg text-white">add</span>，添加类型为<code>Subscribe</code>，URL填写以下<code><span class="icon icon-lg text-white">flash_auto</span>订阅地址</code>并点击右上角完成。接着点击右下角“设置”，在“其他”这一栏点击“服务器订阅”，把“打开时更新”打勾，即可自动更新节点</p>
														<p><span class="icon icon-lg text-white">looks_5</span> 选择任意节点点击连接，然后点击allow后解锁指纹</p>
														<p><span class="icon icon-lg text-white">looks_6</span> 注意：第一次连接可能不能用，导入后程序退出并重新打开程序连接即可！</p>
														<p><span class="icon icon-lg text-white">flash_auto</span> 订阅地址：<input type="text" class="input form-control form-control-monospace" name="input1" readonly="" value="{$baseUrl}/link/{$ssr_sub_token}?mu=0"><button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$baseUrl}/link/{$ssr_sub_token}?mu=0">点击拷贝订阅地址</button><br>
														<!--	单端口多用户端口订阅地址：<code>{$baseUrl}/link/{$ssr_sub_token}?mu=1</code>   -->
														<p><a href="/user/announcement">点击这里查看iOS傻瓜式教程</a></p> 
													</div>
													<div class="tab-pane fade" id="all_ssr_android">
														<p><span class="icon icon-lg text-white">filter_1</span><a href="/ssr-download/ssr-android.apk"> 点击我下载</a>并安装</p>
														<p><span class="icon icon-lg text-white">filter_2</span> 打开App，先点击左上角的shadowsocksR，再点击右下角的<span class="icon icon-lg text-white">add</span>号图标</p>
                                                        <p><span class="icon icon-lg text-white">filter_3</span> 添加/升级 SSR订阅</p>
                                                        <p><span class="icon icon-lg text-white">filter_4</span> 添加订阅地址，输入以下<code><span class="icon icon-lg text-white">flash_auto</span>订阅地址</code>后确定</p>
														<p><span class="icon icon-lg text-white">filter_5</span> 订阅出现系统自带的与谜之屋，请把系统自带的无效订阅左滑删除（自带影响订阅更新速度）</p>
														<p><span class="icon icon-lg text-white">filter_6</span> 勾选"自动更新"并点击"确定并升级"</p>
														<p><span class="icon icon-lg text-white">filter_7</span> 选择任意节点</p>
														<p><span class="icon icon-lg text-white">filter_8</span> 路由选择：绕过局域网及中国大陆地址</p>
                                                        <p><span class="icon icon-lg text-white">filter_9</span> 点击右上角的小飞机图标即可连接</p>
                                                 <!--       <p>两种方式导入所有节点</p>
                                                         <p>1、在手机上默认浏览器中点击<a href="{$ssr_url_all}">这个链接（普通端口）</a>或者<a href="{$ssr_url_all_mu}">这个链接（单端口多用户）</a>，然后点击确定，批量添加完节点，然后路由选择<code>绕过局域网和大陆</code>，右上角开启就可以上网了。同时提供一个 ACL (看您的需要)地址，<a href="/link/{$acl_token}">长按复制地址</a>到客户端里应用即可。</p> 
                                                         <p>手机上默认浏览器中点击<a href="{$ssr_url_all}">这个链接（普通端口）</a>，同时提供一个 ACL (看您的需要)地址，<a href="/link/{$acl_token}">长按复制地址</a>到客户端里路由设置后更新即可。</p>-->													
														<p><span class="icon icon-lg text-white">flash_auto</span> 订阅地址：<input type="text" class="input form-control form-control-monospace" name="input1" readonly="" value="{$baseUrl}/link/{$ssr_sub_token}?mu=0"><button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$baseUrl}/link/{$ssr_sub_token}?mu=0">点击拷贝订阅地址</button><br>
														<!--	单端口多用户端口订阅地址：<code>{$baseUrl}/link/{$ssr_sub_token}?mu=1</code>  -->
														<p><a href="/user/announcement">点击这里查看Android傻瓜式教程</a></p>
													</div>
													<div class="tab-pane fade" id="all_ssr_router">
														<p>路由器 刷入<a href="http://www.right.com.cn/forum/thread-161324-1-1.html">这个固件</a>，然后 SSH 登陆路由器，执行以下命令（导入普通端口）<br>
														<code>wget -O- {$baseUrl}/link/{$router_token}?is_ss=0 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token}?is_ss=0 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														这个单端口多用户的<br>
														<code>wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=0 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=0 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														执行完毕以后就可以到路由器的设置面板里随意选择 Shadowsocks 服务器进行连接了。</p>
													</div>
                                                    <div class="tab-pane fade" id="all_ssr_game">
														<p><span class="icon icon-lg text-white">looks_one</span><a href="/ssr-download/SSTap-beta-setup-1.1.0.1.7z"> 点击我下载</a></p>
														<p><span class="icon icon-lg text-white">looks_two</span> 安装，期间会安装虚拟网卡，请点击允许或确认</p>
														<p><span class="icon icon-lg text-white">looks_3</span> 打开桌面程序SSTap</p>
														<p><span class="icon icon-lg text-white">looks_4</span> 齿轮图标<span class="icon icon-lg text-white">play_arrow</span>SSR订阅<span class="icon icon-lg text-white">play_arrow</span>SSR订阅管理添加以下<code><span class="icon icon-lg text-white">flash_auto</span>订阅地址</code>即可</p>
														<p><span class="icon icon-lg text-white">looks_5</span> 更新后选择其中一个节点闪电图标测试节点-测试UDP转发...通过!（UDP通过即可连接并开始游戏），如测试不通过，点击齿轮图标设置DNS，推荐谷歌DNS</p>
														<p><span class="icon icon-lg text-white">flash_auto</span>	订阅地址：<input type="text" class="input form-control form-control-monospace" name="input1" readonly="" value="{$baseUrl}/link/{$ssr_sub_token}?mu=1"><button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$baseUrl}/link/{$ssr_sub_token}?mu=1">点击拷贝订阅地址</button><br>
														<!--	单端口多用户端口订阅地址：<code>{$baseUrl}/link/{$ssr_sub_token}?mu=1</code>  -->
														</p>
														<p><a href="/user/announcement">点击这里查看游戏客户端傻瓜式教程</a></p>
													</div>
													<div class="tab-pane fade" id="all_ssr_info">
														{$user = URL::getSSRConnectInfo($pre_user)}
														{$ssr_url_all = URL::getAllUrl($pre_user, 0, 0)}
														{$ssr_url_all_mu = URL::getAllUrl($pre_user, 1, 0)}
														
														{if URL::SSRCanConnect($user)}
														<dl class="dl-horizontal">
															<p><dt>端口</dt>
															<dd>{$user->port}</dd></p>

															<p><dt>密码</dt>
															<dd>{$user->passwd}</dd></p>

															<p><dt>自定义加密</dt>
															<dd>{$user->method}</dd></p>

															<p><dt>自定义协议</dt>
															<dd>{$user->protocol}</dd></p>

															<p><dt>自定义混淆</dt>
															<dd>{$user->obfs}</dd></p>
														</dl>
														{else}
															<p>您好，您目前的 加密方式，混淆，或者协议设置在 ShadowsocksR 客户端下无法连接。请您选用 Shadowsocks 客户端来连接，或者到 资料编辑 页面修改后再来查看此处。</p>

															<p>同时, ShadowsocksR 单端口多用户的连接不受您设置的影响,您可以在此使用相应的客户端进行连接~</p>

															<p>请注意，在当前状态下您的 SSR 订阅链接已经失效，您无法通过此种方式导入节点。</p>
														{/if}
													</div>
												<!--    <div class="tab-pane fade" id="all_ssr_windows">
														<p><a href="/ssr-download/ssr-win.7z">下载</a>，解压，运行程序，然后您有三种方式导入所有节点<br>
															(1)下载<a href="/user/getpcconf?is_mu=0&is_ss=0">这个（普通端口）</a>或者<a href="/user/getpcconf?is_mu=1&is_ss=0">这个（单端口多用户）</a>，右键小飞机 服务器 -- 从配置文件导入服务器，选择这个文件，<br>
															(2)点击<a class="copy-text" data-clipboard-text="{$ssr_url_all}">这里（普通端口）</a>或者<a class="copy-text" data-clipboard-text="{$ssr_url_all}">这个(单端口多用户）</a>，然后右键小飞机 -- 从剪贴板复制地址<br>
															(3)(推荐)右键小飞机--服务器--SSR服务器订阅设置，将订阅地址设置为下面的地址，其他参数留空，确定之后再更新 SSR 服务器订阅。<br>
															然后选择一个合适的服务器，系统代理模式选”全局模式”，代理规则选“绕过局域网和大陆”，然后即可上网。</p>

														<p>SSR 订阅地址：<br>
															普通端口地址：<code>{$baseUrl}/link/{$ssr_sub_token}?mu=0</code><br>
															单端口多用户端口地址：<code>{$baseUrl}/link/{$ssr_sub_token}?mu=1</code>
														</p>
													</div>
													<div class="tab-pane fade" id="all_ssr_mac">
														<p><a href="/ssr-download/ssr-mac.dmg">下载</a>，安装，然后下载<a href="/user/getpcconf?is_mu=0&is_ss=0">这个(普通端口)</a>或者<a  href="/user/getpcconf?is_mu=1&is_ss=0">这个（单端口多用户）</a>，运行程序，小飞机上右键 服务器列表 子菜单 的 “导入服务器配置文件...” 导入这个文件，然后选择一个合适的服务器，更新一下PAC，然后开启系统代理即可上网。</p>
													</div>
													<div class="tab-pane fade" id="all_ssr_ios">
														<p>推荐下载<a href="https://itunes.apple.com/cn/app/shadowrocket/id932747118?mt=8">Shadowrocket</a>，然后在 Safari 中点击<a href="{$ssr_url_all}">这个（普通端口）</a>或者<a href="{$ssr_url_all_mu}">这个（单端口多用户）</a>，然后点击确定，就可以批量添加节点。</p>
														<p>SSR 订阅地址：<br>
															普通端口地址：<code>{$baseUrl}/link/{$ssr_sub_token}?mu=0</code><br>
															单端口多用户端口地址：<code>{$baseUrl}/link/{$ssr_sub_token}?mu=1</code>
														</p>
													</div>
													<div class="tab-pane fade" id="all_ssr_android">
														<p><a href="/ssr-download/ssr-android.apk">下载</a>，安装，然后在手机上默认浏览器中点击<a href="{$ssr_url_all}">这个链接（普通端口）</a>或者<a href="{$ssr_url_all_mu}">这个链接（单端口多用户）</a>，然后点击确定，批量添加完节点，然后路由选择绕过大陆，右上角开启就可以上网了。同时提供一个 ACL 地址，<a href="/link/{$acl_token}">长按复制地址</a>到客户端里应用即可。</p>
														<p>SSR 订阅地址，您可以在节点列表处添加订阅来自动更新节点：<br>
															普通端口地址：<code>{$baseUrl}/link/{$ssr_sub_token}?mu=0</code><br>
															单端口多用户端口地址：<code>{$baseUrl}/link/{$ssr_sub_token}?mu=1</code>
														</p>
													</div>
													<div class="tab-pane fade" id="all_ssr_router">
														<p>路由器 刷入<a href="http://www.right.com.cn/forum/thread-161324-1-1.html">这个固件</a>，然后 SSH 登陆路由器，执行以下命令（导入普通端口）<br>
														<code>wget -O- {$baseUrl}/link/{$router_token}?is_ss=0 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token}?is_ss=0 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														或者这个单端口多用户的<br>
														<code>wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=0 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=0 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														执行完毕以后就可以到路由器的设置面板里随意选择 Shadowsocks 服务器进行连接了。</p>
													</div>    -->

												</div>
												<div class="tab-pane fade {if !$ssr_prefer}active in{/if}" id="all_ss">
													<nav class="tab-nav margin-top-no">
														<ul class="nav nav-list">
															<li class="active">
																<a class="waves-attach" data-toggle="tab" href="#all_ss_windows"><i class="icon icon-lg">desktop_windows</i>&nbsp;Windows</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_mac"><i class="icon icon-lg">laptop_mac</i>&nbsp;MacOS</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_linux"><i class="icon icon-lg">dvr</i>&nbsp;Linux</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_ios"><i class="icon icon-lg">phone_iphone</i>&nbsp;iOS</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_android"><i class="icon icon-lg">android</i>&nbsp;Android</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_router"><i class="icon icon-lg">router</i>&nbsp;路由器</a>
															</li>
															<li>
																<a class="waves-attach" data-toggle="tab" href="#all_ss_info"><i class="icon icon-lg">info_outline</i>&nbsp;连接信息</a>
															</li>
														</ul>
													</nav>
													<div class="tab-pane fade active in" id="all_ss_windows">
													    {$user = URL::getSSConnectInfo($pre_user)}
														{$ss_url_all = URL::getAllUrl($pre_user, 0, 1)}
														{$ss_url_all_mu = URL::getAllUrl($pre_user, 1, 1)}
														{$ss_url_all_win = URL::getAllUrl($pre_user, 0, 2)}
														<p><span class="icon icon-lg text-white">looks_one</span><a href="/ssr-download/ss-win.zip"> 点击我下载</a></p>
                                                        <p><span class="icon icon-lg text-white">looks_two</span> 解压至任意磁盘</p>
                                                        <p><span class="icon icon-lg text-white">looks_3</span> 运行程序(以下操作全部在任务栏右下角的纸飞机图标右键操作)</p>
														<p><span class="icon icon-lg text-white">looks_4</span><a class="copy-text" data-clipboard-text="{$ss_url_all_win}"> 点击我复制SS链接</a></p>
														<p><span class="icon icon-lg text-white">looks_5</span> 服务器<span class="icon icon-lg text-white">play_arrow</span>从剪贴板导入URL</p> 
														<p><span class="icon icon-lg text-white">looks_6</span> 然后右键小飞机图标<span class="icon icon-lg text-white">play_arrow</span>服务器<span class="icon icon-lg text-white">play_arrow</span>谜之屋，选择一个合适的服务器，代理规则选“绕过局域网和大陆”，系统代理模式建议选“PAC模式”(PAC模式会根据规则，国内网站不走代理，国外网站走代理；全局模式是所有网站都走代理），即可上网。</p><br>
														<!--	单端口多用户端口订阅地址：<code>{$baseUrl}/link/{$ss_sub_token}?mu=1</code>  -->
														</p>
														<p><a href="/user/announcement">点击这里查看Windows傻瓜式教程</a></p> 
													</div>
													<div class="tab-pane fade" id="all_ss_mac">
														<p><span class="icon icon-lg text-white">filter_1</span><a href="/ssr-download/ss-mac.zip"> 点击我下载</a></p>
                                                      	<p><span class="icon icon-lg text-white">filter_2</span> 打开下载的Zip文件</p>
                                                     	<p><span class="icon icon-lg text-white">filter_3</span> 把ShadowsocksX拖入到Finder的应用程序列表(Applications)</p>
                                                      	<p><span class="icon icon-lg text-white">filter_4</span> 打开Launchapad里的ShadowsocksX</p>
														<p><span class="icon icon-lg text-white">filter_5</span><a href="/user/getpcconf?is_mu=0&is_ss=1"> 点击我下载SS配置文件</a></p>
                                                      	<p><span class="icon icon-lg text-white">filter_6</span> 菜单栏的小飞机图标<span class="icon icon-lg text-white">play_arrow</span>服务器<span class="icon icon-lg text-white">play_arrow</span>导入服务器配置文件</p>
														<p><span class="icon icon-lg text-white">filter_7</span> 菜单栏的小飞机图标<span class="icon icon-lg text-white">play_arrow</span>打开shadowsocks</p><br>
														<!--	单端口多用户端口订阅地址：<code>{$baseUrl}/link/{$ss_sub_token}?mu=1</code>   -->
														</p>
														<p><a href="/user/announcement">点击这里查看Mac傻瓜式教程</a></p> 
													</div>
													<div class="tab-pane fade" id="all_ss_linux">
														<p><a href="/Course.html#Linux">点击这里查看Linux傻瓜式教程</a></p> 
													</div>
													<div class="tab-pane fade" id="all_ss_ios">
                                                        <p><span class="icon icon-lg text-white">looks_one</span> 切换<code>App Store</code>账号-ID:<code>xxxxxxxxx</code> 密码<code>{if $user->class==0}密码仅充值套餐可见{else}xxxxxxxxx{/if}</code>注意特殊符号与大小写,显示按钮buy，3.99$，请直接buy安装（不会扣钱）。（千万不要试图登陆iCloud，会上传您的照片与通讯录到这个账户上）</p>
                                                        <p><span class="icon icon-lg text-white">looks_two</span> 商店搜索<code>Shadowrocket</code>下载安装</p>
                                                      	<p><span class="icon icon-lg text-white">looks_3</span> 安装完成后切换回您自己的账号。（请务必切换回您自己的账户）</p>
												<!--    <p>两种方式导入所有节点</p> 
                                                        <p>1、在 Safari 中点击 <a href="{$ssr_url_all}">这个（普通端口）</a>或者<a href="{$ssr_url_all_mu}">这个（单端口多用户）</a>，然后点击确定，就可以批量添加节点。</p>   -->
														<p><span class="icon icon-lg text-white">looks_4</span> 打开Shadowrocket软件后，点击右上角<span class="icon icon-lg text-white">add</span>，添加类型为<code>Subscribe</code>，URL填写以下<code><span class="icon icon-lg text-white">flash_auto</span>订阅地址</code>并点击右上角完成。接着点击右下角“设置”，在“其他”这一栏点击“服务器订阅”，把“打开时更新”打勾，即可自动更新节点</p>
														<p><span class="icon icon-lg text-white">looks_5</span> 选择任意节点点击连接，然后点击allow后解锁指纹</p>
														<p><span class="icon icon-lg text-white">looks_6</span> 注意：第一次连接可能不能用，导入后程序退出并重新打开程序连接即可！</p>
														<p><span class="icon icon-lg text-white">flash_auto</span> 订阅地址：<input type="text" class="input form-control form-control-monospace" name="input1" readonly="" value="{$baseUrl}/link/{$ssr_sub_token}?mu=0"><button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$baseUrl}/link/{$ssr_sub_token}?mu=0">点击拷贝订阅地址</button><br>
														<!--	单端口多用户端口订阅地址：<code>{$baseUrl}/link/{$ss_sub_token}?mu=1</code>   -->
														<p><a href="/user/announcement">点击这里查看iOS傻瓜式教程</a></p> 
													</div>
													<div class="tab-pane fade" id="all_ss_android">
														<p><span class="icon icon-lg text-white">filter_1</span><a href="/ssr-download/ss-android.apk"> 点击我下载</a>并安装</p>
														<p><span class="icon icon-lg text-white">filter_2</span><a class="copy-text" data-clipboard-text="{$ss_url_all_win}"> 点击我复制SS链接</a></p>
														<p><span class="icon icon-lg text-white">filter_3</span> 打开App，点击右下角的<span class="icon icon-lg text-white">add</span>号图标</p>
                                                        <p><span class="icon icon-lg text-white">filter_4</span> 从剪贴板导入</p>
														<p><span class="icon icon-lg text-white">filter_5</span> 导入后出现系统自带的与谜之屋，请把系统自带的无效订阅左滑删除</p>
														<p><span class="icon icon-lg text-white">filter_6</span> 选择任意节点</p>
														<p><span class="icon icon-lg text-white">filter_7</span> 路由选择：绕过局域网及中国大陆地址</p>
                                                        <p><span class="icon icon-lg text-white">filter_8</span> 点击右上角的小飞机图标即可连接</p>
                                                 <!--       <p>两种方式导入所有节点</p>
                                                         <p>1、在手机上默认浏览器中点击<a href="{$ssr_url_all}">这个链接（普通端口）</a>或者<a href="{$ssr_url_all_mu}">这个链接（单端口多用户）</a>，然后点击确定，批量添加完节点，然后路由选择<code>绕过局域网和大陆</code>，右上角开启就可以上网了。同时提供一个 ACL (看您的需要)地址，<a href="/link/{$acl_token}">长按复制地址</a>到客户端里应用即可。</p> 
                                                         <p>手机上默认浏览器中点击<a href="{$ssr_url_all}">这个链接（普通端口）</a>，同时提供一个 ACL (看您的需要)地址，<a href="/link/{$acl_token}">长按复制地址</a>到客户端里路由设置后更新即可。</p>-->													
												<!--    <p><span class="icon icon-lg text-white">flash_auto</span> 订阅地址：<code>{$baseUrl}/link/{$ss_sub_token}?mu=0</code><br>    -->
														<!--	单端口多用户端口订阅地址：<code>{$baseUrl}/link/{$ssr_sub_token}?mu=1</code>  -->
														<p><a href="/user/announcement">点击这里查看Android傻瓜式教程</a></p>
													</div>
													<div class="tab-pane fade" id="all_ss_router">
														<p>路由器 刷入<a href="http://www.right.com.cn/forum/thread-161324-1-1.html">这个固件</a>，然后 SSH 登陆路由器，执行以下命令（导入普通端口）<br>
														<code>wget -O- {$baseUrl}/link/{$router_token}?is_ss=1 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token}?is_ss=1 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														或者这个单端口多用户的<br>
														<code>wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=1 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=1 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														执行完毕以后就可以到路由器的设置面板里随意选择 Shadowsocks 服务器进行连接了。</p>
													</div>
													<div class="tab-pane fade active in" id="all_ss_info">
														{$user = URL::getSSConnectInfo($pre_user)}
														{$ss_url_all = URL::getAllUrl($pre_user, 0, 1)}
														{$ss_url_all_mu = URL::getAllUrl($pre_user, 1, 1)}
														{$ss_url_all_win = URL::getAllUrl($pre_user, 0, 2)}

														{if URL::SSCanConnect($user)}
														<dl class="dl-horizontal">
															<p>各个节点的地址请到节点列表查看！</p>


															<p><dt>端口</dt>
															<dd>{$user->port}</dd></p>

															<p><dt>密码</dt>
															<dd>{$user->passwd}</dd></p>

															<p><dt>自定义加密</dt>
															<dd>{$user->method}</dd></p>

															<p><dt>自定义混淆</dt>
															<dd>{$user->obfs}</dd></p>
														</dl>
														{else}
															<p>您好，您目前的 加密方式，混淆，或者协议设置在 SS 客户端下无法连接。请您选用 SSR 客户端来连接，或者到 资料编辑 页面修改后再来查看此处。</p>
															<p>同时, Shadowsocks 单端口多用户的连接不受您设置的影响,您可以在此使用相应的客户端进行连接~</p>
														{/if}
													</div>
											<!--    <div class="tab-pane fade" id="all_ss_windows">
														<p><a href="/ssr-download/ss-win.zip">下载</a>，解压，运行程序，然后您有两种方式导入所有节点<br>
															(1)下载<a href="/user/getpcconf?is_mu=0&is_ss=1">这个（普通端口）</a>，放到小飞机的目录下，然后打开小飞机。<br>
															(2)点击<a class="copy-text" data-clipboard-text="{$ss_url_all_win}">这里（普通端口）</a>, 然后右键小飞机 -- 从剪贴板导入 URL<br>
													</div>
													<div class="tab-pane fade" id="all_ss_mac">
														<p><a href="/ssr-download/ss-mac.zip">下载</a>，安装，然后下载<a href="/user/getpcconf?is_mu=0&is_ss=1">这个（普通端口）</a>或者<a href="/user/getpcconf?is_mu=1&is_ss=1">这个（单端口多用户）</a>，运行程序，小飞机上右键 服务器列表 子菜单 的 “导入服务器配置文件...” 导入这个文件，然后选择一个合适的服务器，更新一下PAC，然后开启系统代理即可上网。</p>
													</div>
													<div class="tab-pane fade" id="all_ss_ios">
														<p>推荐下载<a href="https://itunes.apple.com/cn/app/shadowrocket/id932747118?mt=8">Shadowrocket</a>，然后在 Safari 中点击<a href="{$ss_url_all}">这个（普通端口）</a>或者<a href="{$ss_url_all_mu}">这个（单端口多用户）</a>，然后点击确定，就可以批量添加节点。</p>
														<p>iOS 下载<a href="/link/{$ios_token}?is_ss=1">这个（普通端口）</a>或者<a href="/link/{$ios_token}?is_ss=1&is_mu=1">这个（单端口多用户）</a>，导入到 Surge 中，然后就可以随意切换服务器上网了。</p>
													</div>
													<div class="tab-pane fade" id="all_ss_android">
														<p><a href="/ssr-download/ss-android.apk">下载</a>，再<a href="/ssr-download/ss-android-obfs.apk">下载</a>，然后安装，然后在手机上点击<a class="copy-text" data-clipboard-text="{$ss_url_all}">这个链接（普通端口）</a>或者<a class="copy-text" data-clipboard-text="{$ss_url_all_mu}">这个链接（单端口多用户端口）</a>复制到剪贴板，打开 Shadowsocks 客户端，选择从剪贴板导入，然后选择一个节点，设置一下路由为绕过大陆，点击飞机就可以上网了。</p>
													</div>
													<div class="tab-pane fade" id="all_ss_router">
														<p>路由器 刷入<a href="http://www.right.com.cn/forum/thread-161324-1-1.html">这个固件</a>，然后 SSH 登陆路由器，执行以下命令（导入普通端口）<br>
														<code>wget -O- {$baseUrl}/link/{$router_token}?is_ss=1 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token}?is_ss=1 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														或者这个单端口多用户的<br>
														<code>wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=1 | bash && echo -e "\n0 */3 * * * wget -O- {$baseUrl}/link/{$router_token_without_mu}?is_ss=1 | bash\n">> /etc/storage/cron/crontabs/admin && killall crond && crond </code><br>
														执行完毕以后就可以到路由器的设置面板里随意选择 Shadowsocks 服务器进行连接了。</p>
													</div>    -->
												</div>
											</div>
										</div>
										<div class="card-action">
											<div class="card-action-btn pull-left">
												<p><a class="btn btn-brand btn-flat waves-attach" href="/user/url_reset"><span class="icon">close</span>&nbsp;重置我的订阅链接</a></p>
											</div>
										</div>
									</div>

								</div>
							</div>

						</div>

						<div class="col-lg-6 col-md-6">

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading"><i class="icon icon-md">account_circle</i>账号使用情况</p>
										<dl class="dl-horizontal">
											<p><dt>账号等级</dt>
											<dd><i class="icon icon-md t4-text">stars</i>&nbsp;{$user->class}</dd></p>

											<p><dt>等级过期时间</dt>
											<dd><i class="icon icon-md">event</i>&nbsp;{$user->class_expire}</dd></p>

											<p><dt>账号过期时间</dt>
											<dd><i class="icon icon-md">event</i>&nbsp;{$user->expire_in}</dd></p>
											
											<p><dt>速度限制</dt>
											{if $user->node_speedlimit!=0}
											<dd><i class="icon icon-md">settings_input_component</i>&nbsp;{$user->node_speedlimit}Mbps</dd>
											{else}
											<dd><i class="icon icon-md">settings_input_component</i>&nbsp;不限速</dd>
											{/if}</p>

											<p><dt>在线设备数量</dt>
											<dd><i class="icon icon-md">phonelink</i>&nbsp;{$user->online_ip_count()}</dd></p>
											
											<p><dt>余额</dt>
											<dd><i class="icon icon-md">monetization_on</i>&nbsp;{$user->money} CNY</dd></p>
                                          
                                    <!--    <p><dt>设备数量限制</dt>
											{if $user->node_connector!=0}
											<dd>{$user->node_connector}个</dd>
											{else}
                                            <dd>不限制</dd>
											{/if}</p>    -->

									<!--    <p><dt>速度限制</dt>
											{if $user->node_speedlimit!=0}
											<dd>{$user->node_speedlimit}Mbps</dd>
											{else}
											<dd>不限速</dd>
											{/if}</p>    -->

											<p><dt>上次使用</dt>
											<dd><i class="icon icon-md">event</i>&nbsp;{$user->lastSsTime()}</dd></p>
										</dl>
									</div>

								</div>
							</div>

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">

										<div id="traffic_chart" style="height: 300px; width: 100%;"></div>

								<!--    <script src="//cdn.staticfile.org/canvasjs/1.7.0/canvasjs.js"></script>    -->
										<script src="/assets/js/canvasjs.min.js"> </script>
										<script type="text/javascript">
											var chart = new CanvasJS.Chart("traffic_chart",
											{
												theme: "light1",
												title:{
													text: "流量使用情况",
													fontFamily: "Impact",
													fontWeight: "normal"
												},

												legend:{
													verticalAlign: "bottom",
													horizontalAlign: "center"
												},
												data: [
												{
													//startAngle: 45,
													startAngle: -15,
													indexLabelFontSize: 20,
													indexLabelFontFamily: "Garamond",
													indexLabelFontColor: "darkgrey",
													indexLabelLineColor: "darkgrey",
													indexLabelPlacement: "outside",
													yValueFormatString: "##0.00\"%\"",
													//type: "doughnut",
													type: "pie",
													showInLegend: true,
													dataPoints: [
														{if $user->transfer_enable != 0}
														{
															y: {$user->last_day_t/$user->transfer_enable*100}, label:"总用量", legendText:"总用量 {number_format($user->last_day_t/$user->transfer_enable*100,2)}% {$user->LastusedTraffic()}", indexLabel: "总用量 {number_format($user->last_day_t/$user->transfer_enable*100,2)}% {$user->LastusedTraffic()}"
														},
														{
															y: {($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100}, label:"今日", legendText:"今日 {number_format(($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100,2)}% {$user->TodayusedTraffic()}", indexLabel: "今日 {number_format(($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100,2)}% {$user->TodayusedTraffic()}"
														},
														{
															y: {($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100}, label:"剩余用量", legendText:"剩余用量 {number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% {$user->unusedTraffic()}", indexLabel: "剩余用量 {number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% {$user->unusedTraffic()}"
														}
														{/if}
													]
												}
												]
											});

											chart.render();
										</script>

									</div>

								</div>
							</div>



					<!--    <div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">续命获取流量</p>
											<p>流量不会重置，可以通过续命获取流量。</p>

											<p>每次续命可以获取{$config['checkinMin']}~{$config['checkinMax']}MB流量。</p>

											<p>每天可以续命一次。您可以点击按钮或者摇动手机来续命。</p>

											<p>上次续命时间：<code>{$user->lastCheckInTime()}</code></p>

											<p id="checkin-msg"></p>

											{if $geetest_html != null}
												<div id="popup-captcha"></div>
											{/if}
									</div>

									<div class="card-action">
										<div class="card-action-btn pull-left">
											{if $user->isAbleToCheckin() }
												<p id="checkin-btn">
													<button id="checkin" class="btn btn-brand btn-flat waves-attach"><span class="icon">check</span>&nbsp;续命</button>
												</p>
											{else}
												<p><a class="btn btn-brand disabled btn-flat waves-attach" href="#"><span class="icon">check</span>&nbsp;不能续命</a></p>
											{/if}
										</div>
									</div>

								</div>
							</div>    -->


						{if $enable_duoshuo=='true'}

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">讨论区</p>
											<div class="ds-thread" data-thread-key="0" data-title="index" data-url="{$baseUrl}/user/"></div>
											<script type="text/javascript">
											var duoshuoQuery = {

											short_name:"{$duoshuo_shortname}"


											};
												(function() {
													var ds = document.createElement('script');
													ds.type = 'text/javascript';ds.async = true;
													ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
													ds.charset = 'UTF-8';
													(document.getElementsByTagName('head')[0]
													 || document.getElementsByTagName('body')[0]).appendChild(ds);
												})();
											</script>
									</div>

								</div>
							</div>

						{/if}

						{include file='dialog.tpl'}

					</div>


				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}

<script src="/theme/material/js/shake.js/shake.js"></script>


<script>

$(function(){
	new Clipboard('.copy-text');
});

$(".copy-text").click(function () {
	$("#result").modal();
	$("#msg").html("已复制到您的剪贴板，请您继续接下来的操作。");
});

{if $geetest_html == null}


window.onload = function() {
    var myShakeEvent = new Shake({
        threshold: 15
    });

    myShakeEvent.start();

    window.addEventListener('shake', shakeEventDidOccur, false);

    function shakeEventDidOccur () {
		if("vibrate" in navigator){
			navigator.vibrate(500);
		}

        $.ajax({
                type: "POST",
                url: "/user/checkin",
                dataType: "json",
                success: function (data) {
                    $("#checkin-msg").html(data.msg);
                    $("#checkin-btn").hide();
					$("#result").modal();
                    $("#msg").html(data.msg);
                },
                error: function (jqXHR) {
					$("#result").modal();
                    $("#msg").html("发生错误：" + jqXHR.status);
                }
            });
    }
};


$(document).ready(function () {
	$("#checkin").click(function () {
		$.ajax({
			type: "POST",
			url: "/user/checkin",
			dataType: "json",
			success: function (data) {
				$("#checkin-msg").html(data.msg);
				$("#checkin-btn").hide();
				$("#result").modal();
				$("#msg").html(data.msg);
			},
			error: function (jqXHR) {
				$("#result").modal();
				$("#msg").html("发生错误：" + jqXHR.status);
			}
		})
	})
})


{else}


window.onload = function() {
    var myShakeEvent = new Shake({
        threshold: 15
    });

    myShakeEvent.start();

    window.addEventListener('shake', shakeEventDidOccur, false);

    function shakeEventDidOccur () {
		if("vibrate" in navigator){
			navigator.vibrate(500);
		}

        c.show();
    }
};



var handlerPopup = function (captchaObj) {
	c = captchaObj;
	captchaObj.onSuccess(function () {
		var validate = captchaObj.getValidate();
		$.ajax({
			url: "/user/checkin", // 进行二次验证
			type: "post",
			dataType: "json",
			data: {
				// 二次验证所需的三个值
				geetest_challenge: validate.geetest_challenge,
				geetest_validate: validate.geetest_validate,
				geetest_seccode: validate.geetest_seccode
			},
			success: function (data) {
				$("#checkin-msg").html(data.msg);
				$("#checkin-btn").hide();
				$("#result").modal();
				$("#msg").html(data.msg);
			},
			error: function (jqXHR) {
				$("#result").modal();
				$("#msg").html("发生错误：" + jqXHR.status);
			}
		});
	});
	// 弹出式需要绑定触发验证码弹出按钮
	captchaObj.bindOn("#checkin");
	// 将验证码加到id为captcha的元素里
	captchaObj.appendTo("#popup-captcha");
	// 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
};

initGeetest({
	gt: "{$geetest_html->gt}",
	challenge: "{$geetest_html->challenge}",
	product: "popup", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
	offline: {if $geetest_html->success}0{else}1{/if} // 表示用户后台检测极验服务器是否宕机，与SDK配合，用户一般不需要关注
}, handlerPopup);



{/if}


</script>
