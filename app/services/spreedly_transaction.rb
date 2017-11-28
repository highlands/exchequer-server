class SpreedlyTransaction
  def self.spreedly_env
    Spreedly::Environment.new(
      Rails.application.secrets.spreedly_key,
      Rails.application.secrets.spreedly_secret
    )
  end

  def self.purchase(invoice, amount, payment_token)
    transaction = spreedly_env
      .purchase_on_gateway(
        Rails.application.secrets.gateway_token,
        payment_token,
        amount,
        retain_on_success: true
      )
    if transaction.succeeded?
      Payment.create(invoice: invoice,
                     amount: amount,
                     transaction_token: transaction.token)
    end
  rescue Spreedly::TransactionCreationError => e
    raise e
  end
end
