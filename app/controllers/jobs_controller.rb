class JobsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @jobs = Job.all
        render 'jobs/index'
    end

    def create
        new_job = Job.new(job_params)

        if new_job.save
            render json: {job: new_job}, status: :created
        else 
            render json: {errors: new_job.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def lookup
        @job = Job.find_by(id: params[:id])

        if @job
            render 'jobs/create'
        end
    end

    private
        def job_params
            params.permit(
                :url,
                :employer_name,
                :employer_description,
                :job_title,
                :job_description,
                :year_of_experience,
                :education_requirement,
                :industry,
                :base_salary,
                :employment_type_id
            )
        end
end
