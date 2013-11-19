$(document).ready(function () {
    $("#transfer_amount").maskMoney({
        thousands:'.', decimal:',', symbolStay: true
    });
})