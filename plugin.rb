# name: discourse-no-auto-login
# about: A plugin to stop Discourse from auto redirecting with there's only one external identity provider
# version: 0.1
# authors: Jim Kleiber
# url: https://github.com/jimkleiber/discourse-no-auto-login

enabled_site_setting :no_auto_login_enabled

after_initialize do
	class ::ApplicationController
	  module NoAutoLoginRedirectToLogin
			def redirect_to_login
# 			if SiteSetting.no_auto_login_enabled
				dont_cache_page
				cookies[:destination_url] = destination_url
				redirect_to path("/login")
# 			end
			end
	  end
	  prepend NoAutoLoginRedirectToLogin
	end
end
