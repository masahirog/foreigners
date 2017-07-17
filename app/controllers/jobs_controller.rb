class JobsController < ApplicationController
  require 'open-uri'
  require 'nokogiri'
  require 'open_uri_redirections'
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    url = 'http://www.baitoru.com/kanto/jlist/tokyo/mrt11-mrt33/btp1-btp2/'
    charset = nil
    html = open(url, :allow_redirections => :all) do |f|
    charset = f.charset # 文字種別を取得
    f.read # htmlを読み込んで変数htmlに渡す
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)
    doc.css('.list-jobListDetail').each do |content|
      job_id = content.css('.pt03a h2 a').attribute('href').value
      %r|job([^/]*)/| =~ job_id
      job_id = $1.to_i

      title = content.css('.pt03a h2 a').inner_text

      url = "http://www.baitoru.com" + content.css('.pt03a h2 a').attribute('href').value

      appeal = content.css('.pt04a p').inner_text

      pay = content.css('.pt05b .tr01 td').inner_text
      pay = pay.gsub(/([\t|\n])/," ")

      erea = content.css('.pt05b .tr03 td').inner_text
      erea = erea.gsub(/([\t|\n])/," ")

      station = content.css('.pt05b .tr02 td').inner_text
      station = station.gsub(/([\t|\n])/," ")

      image = "http://www.baitoru.com" + content.css('.pt05a .p01 a img').attribute('data-replaceimage').value

      subtitle = content.css('.pt03a p').inner_text

      job = Job.create_with(job_id: job_id, title: title, url: url, appeal: appeal, pay: pay, erea: erea, station: station, image: image, subtitle: subtitle).find_or_create_by(job_id: job_id)
    end


    redirect_to jobs_path


  end

end
