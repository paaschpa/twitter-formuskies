class TweetsController < ApplicationController
  # GET /tweets
  # GET /tweets.xml
  def index
    @tweet = Tweet.new
    @tweets = Tweet.order('created_at desc').all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tweets }
    end
  end
 
  # POST /tweets
  # POST /tweets.xml
  def create
    @tweet = Tweet.new(params[:tweet])
    @tweet.user = User.find(session[:user_id])

    respond_to do |format|
      if @tweet.save
        @tweets = Tweet.order('created_at desc').all
        format.html { redirect_to(tweets_path, :notice => 'Tweet was successfully created.') }
        format.js
        format.xml  { render :xml => @tweet, :status => :created, :location => @tweet }
      else
        format.html { redirect_to :action => "new" }
        format.js 
        format.xml  { render :xml => @tweet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.xml
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to(tweets_url) }
      format.xml  { head :ok }
    end
  end
end
