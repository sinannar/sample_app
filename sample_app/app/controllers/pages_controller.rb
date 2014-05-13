class PagesController < ApplicationController
  
  def home
  	@title = "Home"
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page], :per_page => 9)
    end
  end

  def contact
  	@title = "Contact"
  end

  def about
  	@title = "About"
  end

  def help
  	@title = "Help"
  end

  def pricing
    @title = "Pricing"
  end

  def search
    @title = "Searching " + params[:tags]
    @tagsArr = explode(params[:tags],'#')
    @micropost = Micropost.new
    @results = [] 
    @tagsArr.reject! { |t| t.empty? }

    @mytags = []

    if !@tagsArr.nil?
      @first_tags = current_user.feed.first.tag
      current_user.feed.each do |item|
        @feed_tags = explode(item.tag,'#')
        if !@feed_tags.nil?
          @feed_tags.reject! { |t| t.empty? }
          @mytags.push(@feed_tags)


          @tagsArr.each do |tag|
            @feed_tags.each do |ftag|
              if ftag.strip == tag.strip
                @results.push(item)
                break
              end
            end
          end
          
        end
      end
    end

  

    @feed_items = @results.paginate(:page => params[:page], :per_page => 9)
  end
  def explode(tags,ch)
    if !tags.nil?
      tags = tags.downcase
      @categories = tags.split(ch)
    else
      @categories = tags
    end 

  end

end
