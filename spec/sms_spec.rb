require "sms"

describe SMS do
  subject(:sms) { described_class.new(config, client: client) }

  let(:client) { double(:client, messages: messages) }
  let(:messages) { spy(:messages) }

  let(:config) do
    {
      account_sid: "123",
      auth_token: "33asdf",
      from: "+07983838382",
      to: "+44",
      body: "Thank you for your order, it'll be delivered before 21:00"
    }
  end

  it "Sends text with ETA of the order" do
    args = {
      from: config[:from],
      to: config[:to],
      body: "Thank you for your order, it'll be delivered before 21:00"
    }

    allow(Time). to receive(:now).and_return(Time.parse("21:00"))
    sms.deliver
    expect(messages).to have_received(:create).with(args)
    
  end
end