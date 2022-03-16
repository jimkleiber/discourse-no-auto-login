# name: discourse-no-auto-login
# about: A plugin to stop Discourse from auto redirecting with there's only one external identity provider
# version: 0.1
# authors: Jim Kleiber
# url: https://github.com/jimkleiber/discourse-no-auto-login

enabled_site_setting :no_auto_login_enabled

class ::ApplicationController
  module NoAutoLoginRedirectToLogin
		def redirect_to_login
			if SiteSetting.awesomeness_enabled
				dont_cache_page
				cookies[:destination_url] = destination_url
				redirect_to path("/login")
			end
		end
  end
  singleton_class.prepend NoAutoLoginRedirectToLogin
end
