require "spec_helper"

class ServiceNotReady < StandardError
end

sleep 10 if ENV["JENKINS_HOME"]

context "after provisioning finished" do
  describe server(:server1) do
    # XXX this integration test is intended to test if ansible play finishes
    # successfully. this example looks silly but is enough to test the play
    # itself.
    it "should be able to ping client" do
      result = current_server.ssh_exec("echo -n OK")
      expect(result).to eq "OK"
    end
  end
end
