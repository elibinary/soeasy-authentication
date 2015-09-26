module Soeasy
  module Authentication
    module ByPassword
      def encrypt(psword)
        # self.class.secure_digest(psword, features)
        Authenticate.new.secure_digest(psword)
      end

      def authenticated?(psword)
        password == encrypt(psword)
      end
    end
  end
end
