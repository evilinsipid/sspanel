















{include file='user/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">邀请</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
				
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">注意！</p>

										<p>邀请码请给认识的需要的人。</p>

									<!--	<p>邀请有记录，若被邀请的人违反用户协议，您将会有连带责任。</p>    -->
									</div>
									
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">说明</p>

										<p>当您的余额达到<code>30</code>可发工单请求提现。</p>

									<!--	<p>公共页面不定期发放邀请码，如果用完邀请码可以关注公共邀请。</p>    -->
										
										<p>您每拉一位用户注册，当对方充值时您就会获得对方充值金额的 <code>{$config["code_payback"]} %</code> 的提成。</p>
									</div>
									
								</div>
							</div>
						</div>
					</div>
                    
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
                                        <p class="card-heading">邀请链接</p>
                                        {foreach $codes as $code}

                                            <input type="text" class="input form-control form-control-monospace" name="input1" readonly="" value="http://insipid.info/auth/register?code={$code->code}"><br>
                                        
                                            <small class="text-muted">每个账号唯一邀请链接，不可变更</small><br>
                                        
                                            <button class="copy-text btn btn-subscription" type="button" data-clipboard-text="http://insipid.info/auth/register?code={$code->code}">点击拷贝</button>
                                        {/foreach}
									</div>
									
								</div>
							</div>
						</div>
					</div>
					
                    <div aria-hidden="true" class="modal modal-va-middle fade" id="result" role="dialog" tabindex="-1">
                        <div class="modal-dialog modal-xs">
                            <div class="modal-content">
                                <div class="modal-inner">
                                    <p class="h5 margin-top-sm text-black-hint" id="msg"></p>
                                </div>
                                <div class="modal-footer">
                                    <p class="text-right"><button class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" type="button" id="result_ok">知道了</button></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    
					<!--    <div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<div class="card-inner">
										<p class="card-heading">邀请</p>
										<p>当前您可以生成<code>{$user->invite_num}</code>个邀请码。 </p>
									</div>
									{if $user->invite_num }
									<div class="card-action">
										<div class="card-action-btn pull-left">
											
												<button id="invite" class="btn btn-flat waves-attach">生成我的邀请码</button>
											
										</div>
									</div>
									{/if}
								</div>
							</div>
						</div>
					</div>
					
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								
									<div class="card-inner">
									
										<div class="card-table">
											<div class="table-responsive">
											{$codes->render()}
												<table class="table">
													<thead>
													<tr>
														<th>###</th>
														<th>邀请码(点右键复制链接)</th>
														<th>状态</th>
													</tr>
													</thead>
													<tbody>
													{foreach $codes as $code}
														<tr>
															<td><b>{$code->id}</b></td>
															<td><a href="/auth/register?code={$code->code}" target="_blank">{$code->code}</a>
															</td>
															<td>可用</td>
														</tr>
													{/foreach}
													</tbody>
												</table>
											{$codes->render()}
											</div>
										</div>
									
								</div>
							</div>
						</div>
					</div>    -->
					
					
					
					{include file='dialog.tpl'}
				</div>
                
				<div class="card margin-bottom-no">
					<div class="card-main">
						<div class="card-inner">
							<div class="card-inner">
								<p class="card-heading">返利记录</p>
								<div class="card-table">
									<div class="table-responsive">
									{$paybacks->render()}
										<table class="table">
											<thead>
											<tr>
												<th>返利用户</th>
												<th>返利金额</th>
											</tr>
											</thead>
											<tbody>
											{foreach $paybacks as $payback}
												<tr>
													{if $payback->user()!=null}
														<td>{$payback->user()->user_name}
														</td>
														{else}
														<td>已注销
														</td>
													{/if}
													</td>
													<td>{$payback->ref_get} 元</td>
												</tr>
											{/foreach}
											</tbody>
										</table>
									{$paybacks->render()}
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
                
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}


<script>
    $(function(){
        new Clipboard('.copy-text');
    });
    
    $(".copy-text").click(function () {
        $("#result").modal();
        $("#msg").html("已拷贝邀请链接");
    });
</script>

