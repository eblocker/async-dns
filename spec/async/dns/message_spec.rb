#!/usr/bin/env ruby

# Copyright, 2012, by Samuel G. D. Williams. <http://www.codeotaku.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'async/dns'
require 'base64'

module Async::DNS::MessageSpec
	describe Async::DNS::Message do
		it "should be decoded correctly" do
			data = Base64.decode64(<<-EOF)
			HQCBgAABAAgAAAABA3d3dwV5YWhvbwNjb20AAAEAAcAMAAUAAQAAASwADwZm
			ZC1mcDMDd2cxAWLAEMArAAUAAQAAASwACQZkcy1mcDPAMsBGAAUAAQAAADwA
			FQ5kcy1hbnktZnAzLWxmYgN3YTHANsBbAAUAAQAAASwAEg9kcy1hbnktZnAz
			LXJlYWzAasB8AAEAAQAAADwABGKK/B7AfAABAAEAAAA8AARii7SVwHwAAQAB
			AAAAPAAEYou3GMB8AAEAAQAAADwABGKK/W0AACkQAAAAAAAAAA==
			EOF
	
			message = Async::DNS::decode_message(data)
			expect(message.class).to be == Async::DNS::Message
			expect(message.id).to be == 0x1d00
	
			expect(message.question.size).to be == 1
			expect(message.answer.size).to be == 8
			expect(message.authority.size).to be == 0
			expect(message.additional.size).to be == 1
		end

		it "should fail to decode due to bad AAAA length" do
			data = Base64.decode64(<<-EOF)
			6p6BgAABAAEAAAABCGJhaWNhaWNuA2NvbQAAHAABwAwAHAABAAABHgAEMhd7
			dwAAKRAAAAAAAAAA
			EOF
	
			expect{Async::DNS::decode_message(data)}.to raise_error(Async::DNS::DecodeError)
		end
	end
end
