
class DebtorsController < ApplicationController
    def initialize()
        config.wrap_parameters
    end
    
    def create()
        @debtor = Debtor.new(params[:debtor].permit(:first_name, :last_name, :remote_image_url ))
        image_url = params[:remote_image_url ].gsub('http://','https://')
        @debtor.remote_image_url = image_url
        if params[:amount] > 0 
        @debtor.debits.build(amount: params[:amount], date: params[:date])
        end
        @debtor.save!
        render :created
    end

    def index()
        @debtors =  Debtor
                        .left_joins(:debits)
                        .select('debtors.id, debtors.first_name, debtors.last_name, debtors.image, SUM(debits.amount) AS debit')
                        .group('debtors.id')                
        render json: @debtors
    end

    def destroy()
        @debtor = Debtor.find(params[:id])
        @debtor.destroy
        render :deleted
    end

    def update()
        deleteDebits = []
        @debtor = Debtor.find(params[:id])
        @debtor.update_attributes(params[:debtor].permit(:first_name, :last_name, :remote_image_url))
        image_url = params[:remote_image_url ].gsub('http://','https://')
        @debtor.remote_image_url = image_url
        for debit in params[:debits]
            if debit[:id] == nil
                @debtor.debits.build(amount: debit[:amount], date: debit[:date])
            else
                if debit[:amount] > 0
                @debtor.debits.update(debit[:id], amount: debit[:amount], date: debit[:date])
                deleteDebits << debit[:id]
                end
            end
        end
        @debtor.debits.where.not( id: deleteDebits ).delete_all()
        @debtor.save
        render :updated 
    end

    def show()
        @debtor = Debtor.new
        @debtor =  Debtor
                    .includes(:debits)
                    .find(params[:id])
        render :json => @debtor, :include => {:debits => {:except => [:created_at, :updated_at]}}
    end


end