# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'
  def index; end


  def search
    if params[:code].present? then
       v_code = "products.code"
       p_code = params[:code]
    else
      v_code = "1"
      p_code = "1"
    end
    if params[:manufacturer_id].present? then
      v_manufacturer = "manufacturers.id"
      p_manufacturer = params[:manufacturer_id]
    else
      v_manufacturer = "1"
      p_manufacturer = "1"
    end 
    if params[:group_id].present? then 
      v_group = "groups.id"
      p_group = params[:group_id]  
    else
      v_group = "1"
      p_group = "1"
    end
    if params[:family_id].present? then 
      v_family = "families.id"
      p_family = params[:family_id]  
    else
      v_family = "1"
      p_family = "1"
    end


    #@query = Product.all
    @query = Product.select(
      [
        Product.arel_table[:code].as('code_prod'), Product.arel_table[:description].as('desc_prod'), Product.arel_table[:ean].as('ean_prod'), Product.arel_table[:dun].as('dun_prod'), Product.arel_table[:display].as('display_prod'), Product.arel_table[:quantitie].as('qtde_prod'),Family.arel_table[:description].as('desc_fam'), Group.arel_table[:description].as('desc_group'), Family.arel_table[:id], TaxClassification.arel_table[:description].as('desc_fiscal'), Family.arel_table[:description].as('descr_familia'), Group.arel_table[:description].as('descr_group'), Manufacturer.arel_table[:description].as('descr_fabricante')
      ]
    ).joins(
      Product.arel_table.join(Family.arel_table).on(
        Product.arel_table[:family_id].eq(Family.arel_table[:id])
      ).join_sources
    ).joins(
      Product.arel_table.join(Group.arel_table).on(
        Family.arel_table[:group_id].eq(Group.arel_table[:id])
      ).join_sources
    ).joins(
      Product.arel_table.join(Manufacturer.arel_table).on(
        Group.arel_table[:manufacturer_id].eq(Manufacturer.arel_table[:id])
      ).join_sources
    ).joins(
      Product.arel_table.join(TaxClassification.arel_table).on(
        Product.arel_table[:tax_classification_id].eq(TaxClassification.arel_table[:id])
      ).join_sources
    ).where("products.description LIKE ?" ,"%#{params[:description]}%")
             .where("#{v_code} = ?" , "#{p_code}")
             .where("detach = ?", "#{params[:detach]}") 
             .where("#{v_manufacturer} = ?" , "#{p_manufacturer}")
             .where("#{v_group} = ?" , "#{p_group}")
             .where("#{v_family} = ?" , "#{p_family}")
             


    respond_to do |format|
    format.html
    format.pdf do
      render pdf: "produtos-selecionados",
             disposition:  "attachment",
             template: "dashboard/search.html.erb",
             show_as_html: false, 
             layout: 'pdf.html'
    end
    format.csv do
      headers['Content-Disposition'] = "attachment; filename=\"relatorio-produt\""
      headers['Content-Type'] ||= 'text/csv'
    end
  end
  end

end
