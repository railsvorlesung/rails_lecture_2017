class BlogTest::TestModule

  def test_methode(options = {})
    puts 'test123'

    methode_protected
  end # #test_methode

  def self.test_methode2
    puts 'test321'
  end # .test_methode2
.

  protected

  def methode_protected
    puts 'protected!'
  end # #methode_protected


  private
  def methode_private
    puts 'private'
  end
end


