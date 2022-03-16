# name: discourse-no-auto-login
# about: A plugin to stop Discourse from auto redirecting with there's only one external identity provider
# version: 0.1
# authors: Jim Kleiber
# url: https://github.com/jimkleiber/discourse-no-auto-login

class ::ApplicationController
  module NoAutoLoginRedirectToLogin
		def redirect_to_login
			dont_cache_page
			cookies[:destination_url] = destination_url
			redirect_to path("/login")
		end
  end
  singleton_class.prepend NoAutoLoginRedirectToLogin
end
