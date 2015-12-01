class BlogsController <ApplicationController
   
    before_action :set_post, only:[:edit, :update, :show]
    def index
       
         @blogs = Blog.paginate(page: params[:page], per_page: 2)
    end
    
    def show
        
        
    end
    def edit
     
    end
    def update
        
        if @blog.update(user_params)
          #any
          flash[:success] = "edit Blog successfully"
          redirect_to blogs_path
        else
          render'edit'
        end
      
    end
    def new
       @blog=Blog.new
    end
    def create
         @blog=Blog.new(user_params)
         
         if @blog.save
             flash[:success]="Your user was create successfully"
             redirect_to blogs_path
         else
             render :new
         end
    end
 private
  
    def user_params
        params.require(:blog).permit(:title, :topic, :description, :picture)
    end
    def set_post
       @blog = Blog.find(params[:id]) 
    end
end