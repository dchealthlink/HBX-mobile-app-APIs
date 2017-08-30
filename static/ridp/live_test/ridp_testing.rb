def payload_from url
    text = Net::HTTP.get(URI.parse(url))
    json = OpenStruct.new(body: OpenStruct.new(read: text))
	Api::V1::Mobile::Renderer::BaseRenderer.payload_body json
end

def as_xml payload
	request = Api::V1::Mobile::Ridp::RidpRequest.new(body: payload).create_question_request
	request[:xml].to_xml
end

def call_acapi xml
	response = Acapi::Requestor.request("identity_verification.interactive_verification.initiate_session", {body: xml}, 7)
	response["return_status"].to_i
end

url = 'https://raw.githubusercontent.com/dchealthlink/HBX-mobile-app-APIs/master/static/ridp/new_signup/post_verify_identity.json'

tries = 10
pause = 1

xml = as_xml(payload_from url)



print "Trying #{tries} times on #{Socket.gethostname} at #{Time.now} with #{pause} seconds pause, got statuses ", ((1..tries).map { sleep pause; call_acapi xml}.join ", "), "\n"


