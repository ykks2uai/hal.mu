class FeesController < ApplicationController
layout 'priv'
before_filter :authenticate_user!

  def index
    @fee_calcs = VFeeCalc.all
    last_cutoff = FeeCutoff.order('cutoff_date DESC').first
    year = last_cutoff.cutoff_date.year
    month = last_cutoff.cutoff_date.month
    @terms = []
    10.times do |i|
      term = {}
      m = month + i
      unless m > 12
        term[:month] = m
        term[:year] = year
      else
        term[:month] = m - 12
        term[:year] = year + 1
      end
      @terms << term
    end
  end

end
