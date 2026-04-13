# 使用 NVIDIA 官方封裝好的 PyTorch 映像檔，底層已包含 CUDA 和對應的 torch 版本
FROM nvcr.io/nvidia/pytorch:23.10-py3

# 設定容器啟動後的預設路徑
WORKDIR /workspace

# 安裝 OpenCV 所需的系統級 C++ 動態連結庫 (確保 cv2 import 時不會報錯)
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# 將剛剛寫好的 requirements.txt 複製進容器內
COPY requirements.txt .

# 安裝 Python 套件
RUN pip install --no-cache-dir -r requirements.txt

# 保持容器運作的預設指令
CMD ["/bin/bash"]