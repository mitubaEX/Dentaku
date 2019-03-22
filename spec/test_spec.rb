RSpec.describe Test do

  describe 'input number' do
    subject(:calculator) { Test::Calculator.new(params).eval }

    context 'when input single number' do
      context 'with single number' do
        let(:params) { '1' }
        it 'single number' do
          is_expected.to eq(1)
        end
      end

      context 'when single number with whitespace' do
        let(:params) { '        1' }
        it 'single number with whitespace' do
          is_expected.to eq(1)
        end
      end
    end


    context 'when input multiple number' do
      context 'with double number' do
        let(:params) { '12' }
        it 'double number' do
          is_expected.to eq(12)
        end
      end

      context 'with triple number' do
        let(:params) { '123' }
        it 'triple number' do
          is_expected.to eq(123)
        end
      end
    end

    context 'when input single expression' do
      context 'with double number' do
        let(:params) { '1+2' }
        it 'double number' do
          is_expected.to eq(3)
        end
      end

      context 'with double number with whitespace' do
        let(:params) { '   1   +   2   ' }
        it 'double number with whitespace' do
          is_expected.to eq(3)
        end
      end
    end

    context 'when input multiple expression' do
      context 'with triple number' do
        let(:params) { '1 + 2 + 3' }
        it 'triple number' do
          is_expected.to eq(6)
        end
      end
    end
  end
end
