class Order < ApplicationRecord
	 enum status: { wait: 0, verification: 1, making: 2,preparation:3,done:4 }
end
