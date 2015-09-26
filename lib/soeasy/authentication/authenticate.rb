module Soeasy
  module Authentication
    class Authenticate
        # mattr_accessor :login_regex, :bad_login_message

        LOGIN_REGEX = /\A\w[\w\.\+\-_@]+\z/                     # ASCII, strict
        BAD_LOGIN_MESSAGE = "use only letters, numbers, and .+-_@ please.".freeze
        EMAIL_NAME_REGEX = '[\w\.%\+\-]+'.freeze
        DOMAIN_HEAD_REGEX = '(?:[A-Z0-9\-]+\.)+'.freeze
        DOMAIN_TLD_REGEX = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum|tel)'.freeze
        EMAIL_REGEX = /\A#{email_name_regex}@#{domain_head_regex}#{domain_tld_regex}\z/i
        BAD_EMAIL_MESSAGE = "should look like an email address.".freeze
    end

    def secure_digest(*args)
      Digest::SHA1.hexdigest(args.flatten.join('--'))
    end

    def make_token
      secure_digest(Time.now, (1..10).map{ rand.to_s })
    end
  end
end
