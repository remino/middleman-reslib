require 'open3'

class MiddlemanReslib
	class Minify
		class Rack
			def initialize(app)
				@app = app
			end

			def call(env)
				status, headers, response = @app.call(env)

				if headers['Content-Type']&.include?('text/html')
					response_body = response.join('')
					modified_body = minify(response_body)
					response = [modified_body]
					headers['Content-Length'] = modified_body.bytesize.to_s
				end

				[status, headers, response]
			end

			private

			BINARY_NAME = 'minify'

			def fix_doctype(html)
				html.gsub(/^<!doctype html>/, '<!DOCTYPE html>')
			end

			def minify(html, opts = {})
				Open3.popen3("#{path_to_minify} --html") do |stdin, stdout, stderr, wait_thr|
					stdin.write(html)
					stdin.close

					stdout.read.tap do |output|
						raise stderr.read unless wait_thr.value.success?
						return fix_doctype(output)
					end
				end
			end

			def path_to_minify
				path = `which #{BINARY_NAME}`.strip
				exit_status = $?.exitstatus

				raise "#{BINARY_NAME} not found in PATH." if exit_status > 0

				path
			end
		end
	end
end
