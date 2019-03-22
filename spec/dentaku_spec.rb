RSpec.describe Dentaku do

  describe 'input number' do
    before(:each) do
      @result = Dentaku::Dentaku.new.perform(params)
    end

    context 'when input single number' do
      context 'with single number' do
        let(:params) { '1' }
        it 'single number' do
          expect(@result).to eq(1)
        end
      end

      context 'when single number with whitespace' do
        let(:params) { '        1' }
        it 'single number with whitespace' do
          expect(@result).to eq(1)
        end
      end
    end


    context 'when input multiple number' do
      context 'with double number' do
        let(:params) { '12' }
        it 'double number' do
          expect(@result).to eq(12)
        end
      end

      context 'with triple number' do
        let(:params) { '123' }
        it 'triple number' do
          expect(@result).to eq(123)
        end
      end
    end

    context 'when input single expression' do
      context 'with double number' do
        let(:params) { '1+2' }
        it 'double number' do
          expect(@result).to eq(3)
        end
      end

      context 'with double number with whitespace' do
        let(:params) { '   1   +   2   ' }
        it 'double number with whitespace' do
          expect(@result).to eq(3)
        end
      end
    end

    context 'when input multiple expression' do
      context 'with triple number' do
        let(:params) { '1 + 2 + 3' }
        it 'triple number' do
          expect(@result).to eq(6)
        end
      end

      context 'with multiple number' do
        let(:params) { '1 + 2 + 3 + 4 + 5 +        6 + 7 + 8 + 9 + 10' }
        it 'multiple number' do
          expect(@result).to eq(55)
        end
      end
    end

    context 'when input multiple expression with multi operator' do
      context 'with multiple operator' do
        let(:params) { '20 - 2 * 3 / 4 % 2' }
        it 'multiple number' do
          expect(@result).to eq(19)
        end
      end
    end

    context 'when input multiple expression with paren' do
      context 'with multiple operator with paren' do
        let(:params) { '(20 - 2) * 3 / 4 % 2' }
        it 'multiple number' do
          expect(@result).to eq(1)
        end
      end
    end

    context 'when input function' do
      context 'with single function' do
        let(:params) { 'def f(){ 1 } f' }
        it 'single function' do
          expect(@result).to eq(1)
        end
      end
    end
  end
end
